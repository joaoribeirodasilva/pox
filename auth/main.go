package main

import (
	"os"

	"github.com/joaoribeirodasilva/pox/auth/router"
	"github.com/joaoribeirodasilva/pox/common/db"
	"github.com/joaoribeirodasilva/pox/common/logging"
	"github.com/joaoribeirodasilva/pox/common/server"
)

func main() {
	logging := logging.New()
	database := db.New(logging)
	if err := database.Connect(); err != nil {
		os.Exit(1)
	}

	server := server.New(logging)
	router := router.New(server, database)
	router.Register()
	server.Listen()

	os.Exit(0)
}
