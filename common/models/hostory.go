package models

import "gorm.io/gorm"

type History struct {
	gorm.Model
	OriginalID int    `gorm:"column:originalId;type:int;not null"`
	TableName  string `gorm:"column:tableName;type:string;size:255;not null"`
	Data       string `gorm:"column:tableName;type:MEDIUMTEXT;size:65536;not null"`
}
