package auth

import (
	"time"

	"gorm.io/gorm"
)

type AuthUserGroup struct {
	ID          uint           `json:"id" gorm:"primary key;autoIncrement"`
	AuthGroupID uint           `json:"authGroupId" gorm:"field:auth_group_id;type:uint" validate:"required"`
	AuthGroup   AuthGroup      `json:"authGroup"`
	AuthUserID  uint           `json:"authUserId" gorm:"field:auth_user_id;type:uint" validate:"required"`
	AuthUser    AuthUser       `json:"authUser"`
	CreatedAt   time.Time      `json:"created_at" gorm:"field:created_at"`
	CreatedBy   uint           `json:"created_by" gorm:"field:created_by"`
	UpdatedAt   time.Time      `json:"updated_at" gorm:"field:updated_at"`
	UpdatedBy   uint           `json:"updated_by" gorm:"field:updated_by"`
	DeletedAt   gorm.DeletedAt `json:"deleted_at" gorm:"field:deleted_at"`
	DeletedBy   *uint          `json:"deleted_by" gorm:"field:deleted_by"`
}
