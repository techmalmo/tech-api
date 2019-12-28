package models

// Image model
type Image struct {
	ID              string
	Link            string
	OriginalLink    *string
	AlternativeText *string
}
