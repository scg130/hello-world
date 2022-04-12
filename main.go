package main

import (
	"fmt"
	"log"
	"net/http"

	"github.com/gin-gonic/gin"
)

func main() {
	s := gin.Default()
	s.GET("/", func(ctx *gin.Context) {
		fmt.Println("adfss")
		ctx.JSON(http.StatusOK, "ok!")
	})

	log.Fatal(s.Run())
}
