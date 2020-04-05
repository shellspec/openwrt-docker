all: build test

build:
	docker-compose -f docker-compose.test.yml build

test:
	docker-compose -f docker-compose.test.yml up --build --exit-code-from sut --abort-on-container-exit
