APP_NAME := snippetbox
DIST_DIR := dist

.PHONY: build start stop test build/app build/linux build/darwin-amd64 build/darwin-arm64 build/windows build/all

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
