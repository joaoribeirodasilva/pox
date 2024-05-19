package auth

import (
	"time"

	"gorm.io/gorm"
)

type AuthUser struct {
	ID            uint           `json:"id" gorm:"primary key;autoIncrement"`
	Name          string         `json:"name" gorm:"field:name;type:string;size:255;not null" validate:"required"`
	Surename      string         `json:"surename" gorm:"field:surename;type:string;size:255;not null" validate:"required"`
	Email         string         `json:"email" gorm:"field:email;type:string;size:255;not null;unique" validate:"required"`
	Password      *string        `json:"password" gorm:"field:password;type:string;size:255"`
	AcceptedTerms *time.Time     `json:"acceptedTerms" gorm:"field:accepted_terms"`
	AvatarUrl     string         `json:"avatarUrl" gorm:"field:avatar_url"`
	CreatedAt     time.Time      `json:"created_at" gorm:"field:created_at"`
	CreatedBy     uint           `json:"created_by" gorm:"field:created_by"`
	UpdatedAt     time.Time      `json:"updated_at" gorm:"field:updated_at"`
	UpdatedBy     uint           `json:"updated_by" gorm:"field:updated_by"`
	DeletedAt     gorm.DeletedAt `json:"deleted_at" gorm:"field:deleted_at"`
	DeletedBy     *uint          `json:"deleted_by" gorm:"field:deleted_by"`
}
