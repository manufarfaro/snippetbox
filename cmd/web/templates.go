package main

import "github.com/manufarfaro/snippetbox/internal/models"

type templateData struct {
	Snippet  models.Snippet
	Snippets []models.Snippet
}
