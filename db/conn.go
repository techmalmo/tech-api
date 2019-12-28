package db

import (
	"database/sql"
	"database/sql/driver"
)

// Connection represents database connection (able to execute raw DB queries).
type Connection interface {
	Exec(query string, args ...interface{}) (sql.Result, error)
	Query(query string, args ...interface{}) (*sql.Rows, error)
	QueryRow(query string, args ...interface{}) *sql.Row
}

// Transaction represents database transaction (all methods of Connection interface
// plus Commit/Rollback methods).
type Transaction interface {
	Connection
	driver.Tx
}
