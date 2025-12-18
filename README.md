# snippetbox

![CI](https://github.com/manufarfaro/snippetbox/workflows/CI/badge.svg)
![Go](https://img.shields.io/badge/go-1.25.5-blue.svg)

A web application for managing and sharing code snippets, built following the "Let's Go" tutorial by Alex Edwards. This project demonstrates building a production-ready web application in Go with modern practices.

## Features

- Web-based snippet management
- Template-based HTML rendering
- Static file serving
- RESTful routing
- Clean project structure following Go best practices

## Prerequisites

- **Go** 1.25.5+
  ([Install Go](https://go.dev/doc/install))

## Quick Start

```bash
# Clone the repository
git clone https://github.com/manufarfaro/snippetbox.git
cd snippetbox

# Run the application
go run ./cmd/web

# The server will start on http://localhost:4000
```

## Building

```bash
# Build for your current platform
go build -o snippetbox ./cmd/web

# Build for specific platforms
GOOS=linux GOARCH=amd64 go build -o snippetbox-linux ./cmd/web
GOOS=darwin GOARCH=amd64 go build -o snippetbox-macos ./cmd/web
GOOS=windows GOARCH=amd64 go build -o snippetbox-windows.exe ./cmd/web
```

## Development

The application runs on port `4000` by default. You can modify the port in `cmd/web/main.go`.

## CI/CD

Releases are automatically built and published when code is merged to the `main` branch:

- Cross-platform binaries are built for Linux, macOS (Intel & Apple Silicon), and Windows
- GitHub releases are created with all platform binaries
- See `.github/workflows/release.yml` for details

## Acknowledgments

Based on the "Let's Go" tutorial by Alex Edwards - a comprehensive guide to building web applications with Go.
