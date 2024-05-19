package server

import (
	"fmt"
	"os"
	"os/signal"
	"syscall"
	"time"

	"github.com/gofiber/fiber/v2"
	"github.com/joaoribeirodasilva/pox/common/logging"
)

type Server struct {
	App     *fiber.App
	config  *ServerConfig
	logging *logging.Logging
}

const (
	SHUTDOWN_TIMEOUT = 1
)

func New(logging *logging.Logging) *Server {
	o := new(Server)
	o.logging = logging
	o.config = NewConfig(logging)

	// Custom config
	o.App = fiber.New(fiber.Config{
		Prefork:       true,
		CaseSensitive: true,
		StrictRouting: true,
		ServerHeader:  "Fiber",
		AppName:       "POX",
	})

	return o
}

func (o *Server) Listen() {

	if !o.config.read {
		if err := o.config.Read(); err != nil {
			os.Exit(1)
		}
	}

	addr := fmt.Sprintf("%s:%d", o.config.Ip, o.config.Port)

	go func() {
		// service connections

		if err := o.App.Listen(addr); err != nil {
			o.logging.Log(logging.LOG_ENTRY_ERROR, "Server::Listen", "failed to listen on address '%s'", addr)
			os.Exit(1)
		}
	}()

	quit := make(chan os.Signal, 1)
	signal.Notify(quit, syscall.SIGINT, syscall.SIGTERM)
	<-quit
	o.logging.Log(logging.LOG_ENTRY_INFO, "Server::Listen", "shutingdown server in (%d secs)...", SHUTDOWN_TIMEOUT)
	if err := o.App.ShutdownWithTimeout(SHUTDOWN_TIMEOUT * time.Second); err != nil {
		o.logging.Log(logging.LOG_ENTRY_ERROR, "Server::Listen", "failed to gracefully shutdown server")
		os.Exit(1)
	}

	o.logging.Log(logging.LOG_ENTRY_INFO, "Server::Listen", "server terminated successfully")
}
