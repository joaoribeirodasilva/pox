package controllers

import (
	"net/http"

	"github.com/gin-gonic/gin"
)

/*
type FilterValidators struct {
	ID          int       `binding:"id"`
	CreatedDate time.Time `binding:"createdDate" time_format:"2006-01-02T15:04:05Z"`
	UpdatedDate time.Time `binding:"updatedDate" time_format:"2006-01-02T15:04:05Z"`
	DeletedDate time.Time `binding:"deletedDate" time_format:"2006-01-02T15:04:05Z"`
}
*/

func List(c *gin.Context) {

	//database := c.MustGet("database").(db.Db)
	//logging := c.MustGet("logging").(logging.Logging)

	c.JSON(http.StatusOK, gin.H{"message": "list"})
}

func Get(c *gin.Context) {

	c.JSON(http.StatusOK, gin.H{"message": "get"})
}

func Create(c *gin.Context) {

	c.JSON(http.StatusOK, gin.H{"message": "create"})
}

func Update(c *gin.Context) {

	c.JSON(http.StatusOK, gin.H{"message": "update"})
}

func Delete(c *gin.Context) {

	c.JSON(http.StatusOK, gin.H{"message": "delete"})
}
