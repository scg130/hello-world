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
		ctx.JSON(http.StatusOK, "ok1 !!!")
	})
	fmt.Println("1")
	log.Fatal(s.Run())
}
