package models

import (
	"encoding/json"
	"net/url"
	"time"

	"github.com/techmalmo/tech-api/db"
)

// Event model
type Event struct {
	ID          string     `json:"id,omitempty" xml:"ID,omitempty"`
	Source      *Source    `json:"source,omitempty" xml:"Source,omitempty"`
	SourceURL   *string    `json:"source_url,omitempty" xml:"SourceURL,omitempty"`
	Alias       *string    `json:"alias,omitempty" xml:"Alias,omitempty"`
	Title       string     `json:"title,omitempty" xml:"Title,omitempty"`
	Description string     `json:"description,omitempty" xml:"Description,omitempty"`
	Type        *Type      `json:"type,omitempty" xml:"Type,omitempty"`
	Place       *Place     `json:"place,omitempty" xml:"Place,omitempty"`
	Date        *time.Time `json:"when,omitempty" xml:"Date,omitempty"`
	CreatedAt   time.Time  `json:"created_at,omitempty" xml:"Created,omitempty"`
	UpdatedAt   *time.Time `json:"updated_at,omitempty" xml:"Updated,omitempty"`
}

// ValidateEventURIParams validates provided URI params
func ValidateEventURIParams(url.Values) error {
	// TODO
	return nil
}

// GetAllEvents returns all available events (filtering and range will be implemented later)
func GetAllEvents(conn db.Connection, _ url.Values) (interface{}, error) {
	rows, err := conn.Query(queryGetEvents)
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	var events []*Event

	for rows.Next() {
		var raw []byte
		if err := rows.Scan(&raw); err != nil {
			return nil, err
		}
		event := new(Event)
		if err := json.Unmarshal(raw, event); err != nil {
			return nil, err
		}
		events = append(events, event)
	}
	if rows.Err() != nil {
		return nil, rows.Err()
	}
	return events, nil
}
