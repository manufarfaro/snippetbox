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
- **golang-migrate** for database migrations
  ([Install golang-migrate](https://github.com/golang-migrate/migrate/tree/master/cmd/migrate))

## Quick Start

```bash
# Clone the repository
git clone https://github.com/manufarfaro/snippetbox.git
cd snippetbox

# Run the application (defaults to port 4000)
go run ./cmd/web

# Or specify a custom address/port
go run ./cmd/web -addr=":8080"

# The server will start on http://localhost:4000 (or your specified port)
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

The application runs on port `4000` by default. You can change the port using the `-addr` flag:

```bash
# Run on a different port
go run ./cmd/web -addr=":8080"

# Or when running the built binary
./snippetbox -addr=":8080"
```

## CI/CD

Releases are automatically built and published when code is merged to the `main` branch:

- Cross-platform binaries are built for Linux, macOS (Intel & Apple Silicon), and Windows
- GitHub releases are created with all platform binaries
- See `.github/workflows/release.yml` for details

## Acknowledgments

Based on the "Let's Go" tutorial by Alex Edwards - a comprehensive guide to building web applications with Go.
