package event

import (
	"context"
	"net/url"

	"github.com/tiny-go/lite"
	mw "github.com/tiny-go/middleware"

	"github.com/techmalmo/tech-api/db"
	"github.com/techmalmo/tech-api/event/models"
)

// compile-time type checks
var _ lite.PluralGetter = &Controller{}

// Controller handles event requests
type Controller struct {
	// inherit BaseController functionality (related to middleware)
	*mw.BaseController
	// controller dependencies
	DB db.Connection `inject:"t"`
}

// Init controller
func (c *Controller) Init() error { return nil }

// GetAll available events
func (c *Controller) GetAll(_ context.Context, params url.Values) (interface{}, error) {
	if err := models.ValidateEventURIParams(params); err != nil {
		return nil, err
	}
	return models.GetAllEvents(c.DB, params)
}
