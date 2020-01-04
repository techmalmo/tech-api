package models

// Tag model
type tag struct {
	ID   string `json:"id,omitempty" xml:"ID,omitempty"`
	Name string `json:"name,omitempty" xml:"Name,omitempty"`
}
