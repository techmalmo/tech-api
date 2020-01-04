# tech-api

## Configuration

The following environment variables are available to override the default configuration

**Environment Variable** | **DESCRIPTION**
-------------------------|----------------
API_PORT                 | Port for HTTP API
DB_MAX_CONNECTIONS       | Maximum number of connections to database (default: 5)
DB_URI                   | Database connection URI

## Example

```bash
  $ API_PORT=3000 DB_URI=postgres://postgres:password@localhost:5432/tmp?sslmode=disable GOFLAGS=-mod=vendor go run main.go
```
