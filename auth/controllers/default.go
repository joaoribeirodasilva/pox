package controllers

import "gorm.io/gorm"

type Service struct {
	DB *gorm.DB
}

func New(database *gorm.DB) *Service {
	o := new(Service)
	o.DB = database
	return o
}
