package event

import (
	"github.com/tiny-go/lite"
	mw "github.com/tiny-go/middleware"
)

// add module to the global registry. Preferably do it with init func: to have
// only one instance of the module (keep it as a rule using global registry)
func init() {
	module := lite.NewBaseModule()
	module.Register("", &Controller{BaseController: mw.NewBaseController()})
	lite.Register("events", module)
}
