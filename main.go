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
		ctx.JSON(http.StatusOK, "ok!!!")
	})
	fmt.Println("9")
	log.Fatal(s.Run())
}
