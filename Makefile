GREENLIGHT_BINARY = "greenlightApp"

build_app:
	@echo "Building application binary..."
	env GOOS=linux CGO_ENABLED=0 go build -o ${GREENLIGHT_BINARY} ./cmd/api
	mv ${GREENLIGHT_BINARY} ./bin
	@echo "Done!"

up_build:
	@echo "Stopping docker images (if running)"
	@docker-compose down
	@echo "Building and starting docker images..."
	@docker-compose up --build -d
	@echo "Docker images built and started!"

down:
	@echo "Stopping docker compose..."
	@docker-compose down
	@echo "Done!"

restart: down up_build

test:
	@echo "Testing..."
	@go test -v -race ./.