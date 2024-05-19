package server

import (
	"os"
	"regexp"
	"strconv"
	"strings"

	"github.com/joaoribeirodasilva/pox/common/logging"
	"github.com/joho/godotenv"
)

type ServerConfig struct {
	Ip      string `json:"ip"`
	Port    int64  `json:"port"`
	logging *logging.Logging
	read    bool
}

const (
	defualtAddress = "0.0.0.0"
	defaultPort    = 8081
)

func NewConfig(logging *logging.Logging) *ServerConfig {

	o := new(ServerConfig)
	o.read = false
	o.Ip = defualtAddress
	o.Port = defaultPort
	o.logging = logging

	return o
}

func (o *ServerConfig) Read() error {

	var err error
	godotenv.Load()

	temp := strings.TrimSpace(os.Getenv("SERVER_IP"))
	if temp != "" {
		match, _ := regexp.MatchString(`^((25[0-5]|(2[0-4]|1\d|[1-9]|)\d)\.?\b){4}$`, temp)
		if !match {
			return o.logging.Log(logging.LOG_ENTRY_ERROR, "ServerConfig:Read", "invalid SERVER_IP '%s' ", temp)
		}
	}

	o.Ip = temp

	temp = strings.TrimSpace(os.Getenv("SERVER_PORT"))
	o.Port, err = strconv.ParseInt(temp, 10, 64)
	if err != nil {
		return o.logging.Log(logging.LOG_ENTRY_ERROR, "ServerConfig:Read", "invalid DB_PORT value '%s'", temp)
	}

	return nil
}
