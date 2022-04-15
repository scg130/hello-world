package main

import (
	"log"
	"net/http"

	"github.com/gin-gonic/gin"
)

func main() {
	s := gin.Default()
	s.GET("/", func(ctx *gin.Context) {

		ctx.JSON(http.StatusOK, "ok1!!!")
	})

	log.Fatal(s.Run())
}
