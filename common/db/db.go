package db

import (
	"fmt"

	"github.com/joaoribeirodasilva/pox/common/logging"
	"gorm.io/driver/mysql"
	"gorm.io/gorm"
)

type Db struct {
	Conn    *gorm.DB
	config  *DbConfig
	logging *logging.Logging `json:"-"`
}

func New(logging *logging.Logging) *Db {
	o := new(Db)
	o.config = NewConfig(logging)
	o.logging = logging
	return o
}

func (o *Db) Connect() error {

	var err error
	if !o.config.read {
		if err = o.config.Read(); err != nil {
			return err
		}
	}

	dsn := fmt.Sprintf(
		"%s:%s@tcp(%s:%d)/%s?%s",
		o.config.Username,
		o.config.Password,
		o.config.Host,
		o.config.Port,
		o.config.Database,
		o.config.Options,
	)

	o.Conn, err = gorm.Open(mysql.New(mysql.Config{
		DriverName: "mysql",
		DSN:        dsn,
	}), &gorm.Config{})

	if err != nil {
		return o.logging.Log(logging.LOG_ENTRY_ERROR, "Db:Connect", "database connection error '%s'", err.Error())
	}

	o.logging.Log(logging.LOG_ENTRY_INFO, "Db:Connect", "database connected at '%s:%d'", o.config.Host, o.config.Port)

	return nil
}
