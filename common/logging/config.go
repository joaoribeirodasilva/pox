package logging

import (
	"fmt"
	"log"
	"os"
	"strconv"
	"strings"
	"time"

	"github.com/joho/godotenv"
)

type LOG_ENTRY int

const (
	LOG_ENTRY_NONE LOG_ENTRY = iota
	LOG_ENTRY_ERROR
	LOG_ENTRY_WARNING
	LOG_ENTRY_ACCESS
	LOG_ENTRY_TIMES
	LOG_ENTRY_SLOW
	LOG_ENTRY_DEBUG

	LOG_DEFAULT_ERROR   bool = true
	LOG_DEFAULT_ACCESS  bool = false
	LOG_DEFAULT_DEBUG   bool = false
	LOG_DEFAULT_TIMES   bool = false
	LOG_DEFAULT_FILEMAX int  = 10 * 1024 * 1024
)

var (
	logTypeNames = map[LOG_ENTRY]string{
		LOG_ENTRY_NONE:    " NONE  ",
		LOG_ENTRY_ERROR:   " ERROR ",
		LOG_ENTRY_WARNING: "WARNING",
		LOG_ENTRY_ACCESS:  " ACCESS",
		LOG_ENTRY_DEBUG:   " DEBUG ",
	}
)

type LoggingConfig struct {
	LogDirectory string `json:"logDirectory"`
	LogError     bool   `json:"logError"`
	LogAccess    bool   `json:"logAccess"`
	LogDebug     bool   `json:"logDebug"`
	LogTimes     bool   `json:"logTimes"`
	LogFileMax   int    `json:"fileMax"`
}

func NewConfig() *LoggingConfig {
	o := new(LoggingConfig)
	return o
}

func (o *LoggingConfig) Read() error {

	// Change to json and use validator
	// https://pkg.go.dev/github.com/go-playground/validator/v10
	err := godotenv.Load()
	if err != nil {
		log.Default()
		log.Println(o.makeEntry(LOG_ENTRY_WARNING, "logging::Config::Read", "couldn't find dotenv file"))
	}

	temp := os.Getenv("LOG_DIRECTORY")
	temp = strings.TrimSpace(strings.ToLower(temp))
	if temp == "" {
		strErr := "no log directory defined"
		log.Println(o.makeEntry(LOG_ENTRY_WARNING, "logging::Config::Read", strErr))
		return fmt.Errorf(strErr)
	}
	o.LogDirectory = temp

	temp = strings.TrimSpace(strings.ToLower(os.Getenv("LOG_ERROR")))
	o.LogError, err = strconv.ParseBool(temp)
	if err != nil {
		strErr := fmt.Sprintf("invalid value '%s' for LOG_ERROR variable", temp)
		log.Println(o.makeEntry(LOG_ENTRY_ERROR, "logging::Config::Read", strErr))
		return fmt.Errorf(strErr)
	}

	temp = os.Getenv("LOG_ACCESS")
	temp = strings.TrimSpace(strings.ToLower(temp))
	if temp == "true" {
		o.LogAccess = true
	} else if temp == "" {
		o.LogAccess = false
	} else {
		strErr := fmt.Sprintf("invalid value '%s' for LOG_ACCESS variable", temp)
		log.Println(o.makeEntry(LOG_ENTRY_ERROR, "logging::Config::Read", strErr))
		return fmt.Errorf(strErr)
	}

	temp = os.Getenv("LOG_DEBUG")
	temp = strings.TrimSpace(strings.ToLower(temp))
	if temp == "true" {
		o.LogDebug = true
	} else if temp == "" {
		o.LogDebug = false
	} else {
		strErr := fmt.Sprintf("invalid value '%s' for LOG_DEBUG variable", temp)
		log.Println(o.makeEntry(LOG_ENTRY_ERROR, "logging::Config::Read", strErr))
		return fmt.Errorf(strErr)
	}

	temp = os.Getenv("LOG_TIMES")
	temp = strings.TrimSpace(strings.ToLower(temp))
	if temp == "true" {
		o.LogTimes = true
	} else if temp == "" {
		o.LogTimes = false
	} else {
		strErr := fmt.Sprintf("invalid value '%s' for LOG_TIMES variable", temp)
		log.Println(o.makeEntry(LOG_ENTRY_ERROR, "logging::Config::Read", strErr))
		return fmt.Errorf(strErr)
	}

	temp = os.Getenv("LOG_FILEMAX")
	temp = strings.TrimSpace(strings.ToLower(temp))
	if temp == "" {
		o.LogFileMax = LOG_DEFAULT_FILEMAX
	} else {
		var err error
		o.LogFileMax, err = strconv.Atoi(temp)
		if err != nil {
			strErr := fmt.Sprintf("invalid value '%s' for LOG_FILEMAX variable", temp)
			log.Println(o.makeEntry(LOG_ENTRY_ERROR, "logging::Config::Read", strErr))
			return fmt.Errorf(strErr)
		}
	}

	return nil
}

func (o *LoggingConfig) makeEntry(LogType LOG_ENTRY, Location string, Text string) string {

	now := time.Now()

	entry := fmt.Sprintf(
		"%s [%s] [%s] -> %s",
		now.Format(time.RFC3339Nano),
		logTypeNames[LogType],
		Location,
		Text,
	)

	return entry
}
