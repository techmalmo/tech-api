package models

// Place of event
type Place struct {
	ID      string  `json:"id,omitempty" xml:"ID,omitempty"`
	Name    string  `json:"name,omitempty" xml:"Name,omitempty"`
	ZipCode *string `json:"zip_code,omitempty" xml:"ZipCode,omitempty"`
	Country *string `json:"country,omitempty" xml:"Country,omitempty"`
	City    *string `json:"city,omitempty" xml:"City,omitempty"`
	Address *string `json:"address,omitempty" xml:"Address,omitempty"`
	LatLong *Point  `json:"coordinats,omitempty" xml:"Coordinats,omitempty"`
}

// Point on the map
type Point struct {
	Lattitude float64
	Longitude float64
}
