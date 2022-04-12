package main

import (
	"github.com/gin-gonic/gin"
	"log"
	"net/http"
)

func main() {
	s := gin.Default()
	s.GET("/",func(ctx *gin.Context) {
		ctx.JSON(http.StatusOK,"ok")
	})
	log.Fatal(s.Run())
}