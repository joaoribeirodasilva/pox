package auth

import (
	"time"

	"gorm.io/gorm"
)

type AuthPermission struct {
	ID                uint `json:"id" gorm:"primary key;autoIncrement"`
	OrgOrganizationID uint `json:"orgOrganizationId" gorm:"field:org_organization_id;type:uint;not null" validate:"required"`
	// OrgOrganization //TODO: insert object here
	AuthUserID   *uint      `json:"authUserId" gorm:"field:auth_user_id;type:uint"`
	AuthUser     *AuthUser  `json:"authUser"`
	AuthGroupID  *uint      `json:"authGroupId" gorm:"field:auth_group_id;type:uint"`
	AuthGroup    *AuthGroup `json:"authGroup"`
	AuthRoleID   *uint      `json:"authRoleId" gorm:"field:auth_role_id;type:uint"`
	AuthRole     *AuthRole  `json:"authRole"`
	ResReourceID uint       `json:"resResourceId" gorm:"field:res_resource_id;type:uint;not null" validate:"required"`
	// ResReource //TODO: insert object here
	Create    bool           `json:"create" gorm:"field:create;type:uint;not null;default:0" validate:"required"`
	Read      bool           `json:"read" gorm:"field:read;type:uint;not null;default:0" validate:"required"`
	Update    bool           `json:"update" gorm:"field:update;type:uint;not null;default:0" validate:"required"`
	Delete    bool           `json:"delete" gorm:"field:delete;type:uint;not null;default:0" validate:"required"`
	CreatedAt time.Time      `json:"created_at" gorm:"field:created_at"`
	CreatedBy uint           `json:"created_by" gorm:"field:created_by"`
	UpdatedAt time.Time      `json:"updated_at" gorm:"field:updated_at"`
	UpdatedBy uint           `json:"updated_by" gorm:"field:updated_by"`
	DeletedAt gorm.DeletedAt `json:"deleted_at" gorm:"field:deleted_at"`
	DeletedBy *uint          `json:"deleted_by" gorm:"field:deleted_by"`
}
