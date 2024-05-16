package logging

import (
	"os"
	"strconv"
	"strings"

	"github.com/joho/godotenv"
)

type LoggingConfig struct {
	LogAccess bool `json:"logAccess"`
	LogDebug  bool `json:"logDebug"`
	LogTimes  bool `json:"logTimes"`
	read      bool
}

func NewConfig() *LoggingConfig {
	o := new(LoggingConfig)
	return o
}

func (o *LoggingConfig) Read() {

	o.read = false
	godotenv.Load()

	o.LogAccess = LOG_DEFAULT_ACCESS
	o.LogDebug = LOG_DEFAULT_DEBUG
	o.LogTimes = LOG_DEFAULT_TIMES

	temp := os.Getenv("LOG_ACCESS")
	tempBool, err := strconv.ParseBool(strings.TrimSpace(temp))
	if err == nil {
		o.LogAccess = tempBool
	}

	temp = os.Getenv("LOG_DEBUG")
	tempBool, err = strconv.ParseBool(strings.TrimSpace(temp))
	if err == nil {
		o.LogDebug = tempBool
	}

	temp = os.Getenv("LOG_TIMES")
	tempBool, err = strconv.ParseBool(strings.TrimSpace(temp))
	if err == nil {
		o.LogTimes = tempBool
	}

	o.read = true

	return
}
