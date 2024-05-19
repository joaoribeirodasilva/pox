package logging

import (
	"fmt"
	"time"
)

type LOG_ENTRY int

const (
	LOG_ENTRY_NONE LOG_ENTRY = iota
	LOG_ENTRY_ERROR
	LOG_ENTRY_WARNING
	LOG_ENTRY_INFO
	LOG_ENTRY_ACCESS
	LOG_ENTRY_TIMES
	LOG_ENTRY_SLOW
	LOG_ENTRY_DEBUG

	LOG_DEFAULT_ERROR  bool = true
	LOG_DEFAULT_ACCESS bool = false
	LOG_DEFAULT_DEBUG  bool = false
	LOG_DEFAULT_TIMES  bool = false
)

var (
	logTypeNames = map[LOG_ENTRY]string{
		LOG_ENTRY_NONE:    " NONE  ",
		LOG_ENTRY_ERROR:   " ERROR ",
		LOG_ENTRY_WARNING: "WARNING",
		LOG_ENTRY_INFO:    " INFO  ",
		LOG_ENTRY_ACCESS:  "ACCESS ",
		LOG_ENTRY_DEBUG:   " DEBUG ",
	}
)

type Logging struct {
	Config *LoggingConfig
}

func New() *Logging {
	o := new(Logging)
	o.Config = NewConfig()
	return o
}

func (o *Logging) Log(LogType LOG_ENTRY, Location string, Format string, a ...any) error {

	if !o.Config.read {
		o.Config.Read()
	}

	f := fmt.Sprintf(Format, a...)
	entry := o.makeEntry(LogType, Location, f)
	if entry == "" {
		return nil
	}
	fmt.Printf("%s\n", entry)
	if LogType == LOG_ENTRY_ERROR {
		return fmt.Errorf(Format, a...)
	}
	return nil
}

func (o *Logging) makeEntry(LogType LOG_ENTRY, Location string, Text string) string {

	if (LogType == LOG_ENTRY_DEBUG && !o.Config.LogDebug) ||
		(LogType == LOG_ENTRY_ACCESS && !o.Config.LogAccess) ||
		(LogType == LOG_ENTRY_TIMES && !o.Config.LogTimes) {
		return ""
	}

	now := time.Now()
	entry := fmt.Sprintf(
		"%s [%s] [%s] -> %s",
		now.Format(time.RFC3339),
		logTypeNames[LogType],
		Location,
		Text,
	)

	return entry
}
