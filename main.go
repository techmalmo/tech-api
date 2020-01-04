package main

import (
	"database/sql"
	"fmt"
	"log"
	"net/http"

	"github.com/tiny-go/codec/driver"
	"github.com/tiny-go/config"
	"github.com/tiny-go/lite"

	// register codecs
	_ "github.com/tiny-go/codec/driver/json"
	_ "github.com/tiny-go/codec/driver/xml"

	_ "github.com/jackc/pgx/stdlib" // init pgx driver

	// register event module
	_ "github.com/techmalmo/tech-api/event"

	local "github.com/techmalmo/tech-api/config"
)

func main() {
	// set JSON codec as a default
	driver.Default("application/json")
	// load config
	conf := new(local.Config)
	if err := config.Init(conf, ""); err != nil {
		log.Fatal(err)
	}

	// create database instance and test the connection
	db, err := sql.Open("pgx", conf.DB.URI)
	if err != nil {
		log.Fatalf("Failed to connect to database: %s", err)
	}
	if err := db.Ping(); err != nil {
		log.Fatalf("Cannot ping the database: %s", err)
	}
	db.SetMaxOpenConns(conf.DB.MaxConnections)

	// create new handler
	handler := lite.NewHandler()
	// map db to the injector
	handler.Map(db)
	// register modules
	lite.Modules(func(alias string, module lite.Module) bool {
		handler.Use(alias, module)
		return true
	})
	// start HTTP server
	log.Printf("Starting HTTP server on port %d", conf.API.Port)
	log.Fatal(http.ListenAndServe(fmt.Sprintf(":%d", conf.API.Port), handler))
}
