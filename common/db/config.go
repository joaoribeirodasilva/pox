package db

import (
	"os"
	"strconv"
	"strings"

	"github.com/joaoribeirodasilva/pox/common/logging"
	"github.com/joho/godotenv"
)

type DbConfig struct {
	Host     string           `json:"host"`
	Port     int64            `json:"port"`
	Database string           `json:"database"`
	Username string           `json:"username"`
	Password string           `json:"password"`
	Options  string           `json:"options"`
	logging  *logging.Logging `json:"-"`
	read     bool
}

func NewConfig(logging *logging.Logging) *DbConfig {
	o := new(DbConfig)
	o.logging = logging
	o.read = false
	return o
}

func (o *DbConfig) Read() error {

	var err error
	godotenv.Load()

	temp := strings.TrimSpace(os.Getenv("DB_HOST"))
	if temp == "" {
		return o.logging.Log(logging.LOG_ENTRY_ERROR, "DbConfig:Read", "invalid DB_HOST empty value ")
	}
	o.Host = temp

	temp = strings.TrimSpace(os.Getenv("DB_PORT"))
	o.Port, err = strconv.ParseInt(temp, 10, 64)
	if err != nil {
		return o.logging.Log(logging.LOG_ENTRY_ERROR, "DbConfig:Read", "invalid DB_PORT value '%s'", temp)
	}

	temp = strings.TrimSpace(os.Getenv("DB_DATABASE"))
	if temp == "" {
		return o.logging.Log(logging.LOG_ENTRY_ERROR, "DbConfig:Read", "invalid DB_DATABASE empty value")
	}
	o.Database = temp

	temp = strings.TrimSpace(os.Getenv("DB_USERNAME"))
	if temp == "" {
		return o.logging.Log(logging.LOG_ENTRY_ERROR, "DbConfig:Read", "invalid DB_USERNAME empty value")
	}
	o.Username = temp

	temp = strings.TrimSpace(os.Getenv("DB_PASSWORD"))
	if temp == "" {
		return o.logging.Log(logging.LOG_ENTRY_ERROR, "DbConfig:Read", "invalid DB_PASSWORD empty value")
	}
	o.Password = temp

	o.Options = strings.TrimSpace(os.Getenv("DB_OPTIONS"))

	o.read = true
	return nil
}
