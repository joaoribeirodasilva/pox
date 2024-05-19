package router

import (
	"github.com/joaoribeirodasilva/pox/auth/controllers"
	"github.com/joaoribeirodasilva/pox/common/db"
	"github.com/joaoribeirodasilva/pox/common/server"
)

type Router struct {
	server      *server.Server
	controllers *controllers.Service
}

func New(server *server.Server, database *db.Db) *Router {

	o := new(Router)
	o.server = server
	o.controllers = controllers.New(database.Conn)

	return o
}

func (o *Router) Register() {

	o.server.App.Post("/auth/login", o.controllers.Login)
	o.server.App.Post("/auth/authorize", o.controllers.Authorize)
	o.server.App.Put("/auth/refresh", o.controllers.Refresh)
	o.server.App.Delete("/auth/logout", o.controllers.Logout)

	o.server.App.Get("/auth/groups", o.controllers.AuthGroupsList)
	o.server.App.Get("/auth/groups/:id", o.controllers.AuthGroupsGet)
	o.server.App.Post("/auth/groups", o.controllers.AuthGroupsCreate)
	o.server.App.Put("/auth/groups/:id", o.controllers.AuthGroupsUpdate)
	o.server.App.Patch("/auth/groups/:id", o.controllers.AuthGroupsUpdate)
	o.server.App.Delete("/auth/groups/:id", o.controllers.AuthGroupsDelete)

	o.server.App.Get("/auth/permissions", o.controllers.AuthPermissionsList)
	o.server.App.Get("/auth/permissions/:id", o.controllers.AuthPermissionsGet)
	o.server.App.Post("/auth/permissions", o.controllers.AuthPermissionsCreate)
	o.server.App.Put("/auth/permissions/:id", o.controllers.AuthPermissionsUpdate)
	o.server.App.Patch("/auth/permissions/:id", o.controllers.AuthPermissionsUpdate)
	o.server.App.Delete("/auth/permissions/:id", o.controllers.AuthPermissionsDelete)

	o.server.App.Get("/auth/roles", o.controllers.AuthRolesList)
	o.server.App.Get("/auth/roles/:id", o.controllers.AuthRolesGet)
	o.server.App.Post("/auth/roles", o.controllers.AuthRolesCreate)
	o.server.App.Put("/auth/roles/:id", o.controllers.AuthRolesUpdate)
	o.server.App.Patch("/auth/roles/:id", o.controllers.AuthRolesUpdate)
	o.server.App.Delete("/auth/roles/:id", o.controllers.AuthRolesDelete)

	o.server.App.Get("/auth/sessions", o.controllers.AuthSessionsList)
	o.server.App.Get("/auth/sessions/:id", o.controllers.AuthSessionsGet)
	o.server.App.Post("/auth/sessions", o.controllers.AuthSessionsCreate)
	o.server.App.Put("/auth/sessions/:id", o.controllers.AuthSessionsUpdate)
	o.server.App.Patch("/auth/sessions/:id", o.controllers.AuthSessionsUpdate)
	o.server.App.Delete("/auth/sessions/:id", o.controllers.AuthSessionsDelete)

	o.server.App.Get("/auth/usergroups", o.controllers.AuthUserGroupsList)
	o.server.App.Get("/auth/usergroups/:id", o.controllers.AuthUserGroupsGet)
	o.server.App.Post("/auth/usergroups", o.controllers.AuthUserGroupsCreate)
	o.server.App.Put("/auth/usergroups/:id", o.controllers.AuthUserGroupsUpdate)
	o.server.App.Patch("/auth/usergroups/:id", o.controllers.AuthUserGroupsUpdate)
	o.server.App.Delete("/auth/usergroups/:id", o.controllers.AuthUserGroupsDelete)

	o.server.App.Get("/auth/users", o.controllers.AuthUsersList)
	o.server.App.Get("/auth/users/:id", o.controllers.AuthUsersGet)
	o.server.App.Post("/auth/users", o.controllers.AuthUsersCreate)
	o.server.App.Put("/auth/users/:id", o.controllers.AuthUsersUpdate)
	o.server.App.Patch("/auth/users/:id", o.controllers.AuthUsersUpdate)
	o.server.App.Delete("/auth/users/:id", o.controllers.AuthUsersDelete)
}
