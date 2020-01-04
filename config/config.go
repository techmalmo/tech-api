package config

// Config defines the settings of the application
type Config struct {
	API struct {
		Port int `default:"8080"`
	}
	DB struct {
		URI            string
		MaxConnections int `default:"1"`
	}
}
