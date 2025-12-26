package models

import (
	"database/sql"
	"time"
)

type Snippet struct {
	ID        int
	Title     string
	Content   string
	CreatedAt time.Time
	ExpiresAt time.Time
}

type SnippetModel struct {
	DB *sql.DB
}

func (m *SnippetModel) Get(id int) (Snippet, error) {
	stmt := "SELECT title, content, created_at, expires_at FROM snippets WHERE id=$1"
	snippet := Snippet{}
	err := m.DB.QueryRow(stmt, id).Scan(snippet.Title, snippet.Content, snippet.CreatedAt, snippet.ExpiresAt)
	if err != nil {
		return Snippet{}, err
	}
	return snippet, nil
}

func (m *SnippetModel) Latest() ([]Snippet, error) {
	stmt := "SELECT id, title, content, created_at, expires_at FROM snippets ORDER BY created_at DESC LIMIT 10"
	rows, err := m.DB.Query(stmt)
	if err != nil {
		return nil, err
	}

	defer rows.Close()

	snippets := []Snippet{}
	for rows.Next() {
		snippet := Snippet{}
		err := rows.Scan(&snippet.ID, &snippet.Title, &snippet.Content, &snippet.CreatedAt, &snippet.ExpiresAt)
		if err != nil {
			return nil, err
		}
		snippets = append(snippets, snippet)
	}

	if err = rows.Err(); err != nil {
		return nil, err
	}

	return snippets, nil
}

func (m *SnippetModel) Insert(title string, content string, expiresAt int) (int, error) {
	stmt := "INSERT INTO snippets (title, content, created_at, expires_at) VALUES ($1, $2, NOW(), NOW() + INTERVAL '1' DAY * $3) RETURNING id"

	var id int
	err := m.DB.QueryRow(stmt, title, content, expiresAt).Scan(&id)
	if err != nil {
		return 0, err
	}

	return id, nil
}
