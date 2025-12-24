APP_NAME := snippetbox
DIST_DIR := dist
MIGRATIONS_PATH := ./migrations
DB_DSN ?= postgres://snippetbox:snippetbox@localhost:5432/snippetbox?sslmode=disable

.PHONY: build start stop test build/app build/linux build/darwin-amd64 build/darwin-arm64 build/windows build/all
.PHONY: migrate/up migrate/down migrate/version migrate/create

build:
	docker compose build

start:
	docker compose up -d

stop:
	docker compose down

test:
	go test -v ./...

build/app:
	go build -o ./bin/$(APP_NAME) ./cmd/web

build/linux:
	GOOS=linux GOARCH=amd64 go build -o $(DIST_DIR)/$(APP_NAME)-linux-x86_64 ./cmd/web

build/darwin-amd64:
	GOOS=darwin GOARCH=amd64 go build -o $(DIST_DIR)/$(APP_NAME)-macos-x86_64 ./cmd/web

build/darwin-arm64:
	GOOS=darwin GOARCH=arm64 go build -o $(DIST_DIR)/$(APP_NAME)-macos-aarch64 ./cmd/web

build/windows:
	GOOS=windows GOARCH=amd64 go build -o $(DIST_DIR)/$(APP_NAME)-windows-x86_64.exe ./cmd/web

build/all: build/linux build/darwin-amd64 build/darwin-arm64 build/windows

# Migrations
migrate/up:
	migrate -path $(MIGRATIONS_PATH) -database "$(DB_DSN)" up

migrate/down:
	migrate -path $(MIGRATIONS_PATH) -database "$(DB_DSN)" down 1

migrate/version:
	migrate -path $(MIGRATIONS_PATH) -database "$(DB_DSN)" version

migrate/create:
	@read -p "Migration name: " name; \
	migrate create -ext sql -dir $(MIGRATIONS_PATH) -seq $$name
