package models

// Source model
type Source struct {
	ID         string      `json:"id,omitempty" xml:"ID,omitempty"`
	Name       string      `json:"name,omitempty" xml:"Name,omitempty"`
	Properties interface{} `json:"properties,omitempty" xml:"Properties,omitempty"`
}
