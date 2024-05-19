package router

import (
	"github.com/gin-gonic/gin"
	"github.com/joaoribeirodasilva/pox/common/db"
	"github.com/joaoribeirodasilva/pox/common/logging"
	"github.com/joaoribeirodasilva/pox/common/server"
	"github.com/joaoribeirodasilva/pox/history/controllers"
)

type Router struct {
	server   *server.Server
	logging  *logging.Logging
	database *db.Db
}

func New(server *server.Server, database *db.Db, logging *logging.Logging) *Router {

	o := new(Router)
	o.server = server
	o.database = database
	o.logging = logging

	return o
}

func (o *Router) Register() {

	o.server.Router.GET("/history", o.Shared(), o.IsLogged(), controllers.List)
	o.server.Router.GET("/history/:id", o.Shared(), o.IsLogged(), controllers.Get)
	o.server.Router.POST("/history/", o.Shared(), o.IsLogged(), controllers.Create)
	o.server.Router.PUT("/history/:id", o.Shared(), o.IsLogged(), controllers.Update)
	o.server.Router.PATCH("/history/:id", o.Shared(), o.IsLogged(), controllers.Update)
	o.server.Router.DELETE("/history/:id", o.Shared(), o.IsLogged(), controllers.Delete)
	o.server.Router.OPTIONS("/history/", o.Options())
	o.server.Router.OPTIONS("/history/:id", o.Options())
}

func (o *Router) Shared() gin.HandlerFunc {
	return func(c *gin.Context) {
		c.Set("database", o.database)
		c.Set("logging", o.logging)
		c.Next()
	}
}

func (o *Router) IsLogged() gin.HandlerFunc {
	return func(c *gin.Context) {
		// TODO:
		c.Next()
	}
}

func (o *Router) Options() gin.HandlerFunc {
	return func(c *gin.Context) {
		// TODO:
		c.Next()
	}
}
