.PHONY: init
init:
	go install github.com/google/wire/cmd/wire@latest
	go install github.com/golang/mock/mockgen@latest
	go install github.com/swaggo/swag/cmd/swag@latest

.PHONY: bootstrap
bootstrap:
	cd ./deploy/docker-compose && docker compose up -d && cd ../../
	go run ./cmd/migration
	nunu run ./cmd/server

.PHONY: mock
mock:
	mockgen -source=internal/service/user.go -destination test/mocks/service/user.go
	mockgen -source=internal/repository/user.go -destination test/mocks/repository/user.go
	mockgen -source=internal/repository/repository.go -destination test/mocks/repository/repository.go

.PHONY: test
test:
	go test -coverpkg=./internal/handler,./internal/service,./internal/repository -coverprofile=./coverage.out ./test/server/...
	go tool cover -html=./coverage.out -o coverage.html

.PHONY: build
build:
	go build -ldflags="-s -w" -o ./bin/server ./cmd/server

.PHONY: docker
docker:
	# Docker Hub 登录
	echo $(secrets.DOCKER_USERNAME) | docker login --username $(secrets.DOCKER_USERNAME) --password-stdin

	# 构建 Docker 镜像
	docker build -f deploy/build/Dockerfile --build-arg APP_RELATIVE_PATH=./cmd/task -t docker.io/${{ secrets.DOCKER_USERNAME }}/pandorahelper:latest .

	# 推送镜像到 Docker Hub
	docker push $(DOCKER_USER)/PandoraHelper:latest

.PHONY: swag
swag:
	swag init  -g cmd/server/main.go -o ./docs --parseDependency
