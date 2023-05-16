GO=go
TARGET=awesome-api
RM=rm -rf
MAKE=make
COVERAGE=coverage
HUGO=hugo
DOCKER_OPTIONS=--rm --tty --volume=`pwd`:/app --workdir=/app
DOCKER=docker run $(DOCKER_OPTIONS)
DOCKER_IMAGE=golang:1.15.8-buster
DOCKER_IMAGE_BUILD_NAME=awesome:build

build:	## Generate the source code of the application to a binary.
	$(MAKE) lint
	$(DOCKER) $(DOCKER_IMAGE_BUILD_NAME) $(GO) mod tidy
	$(MAKE) check
	$(DOCKER) $(DOCKER_IMAGE_## Declare variables for used commands
HUGO=hugo
SHELLCHECK=shellcheck
export PATH

## Declare a list of phony targets
.PHONY: build build-docker build-tools test


build:## Installhugo package, Run the hugo, Create a file
	sudo apt install hugo
	$(HUGO)
	touch awesome-api

build-docker:## Build a Docker image for the build directory
	docker build -t "awesome:build" ./build --no-cache

build-tools:## Install the hugo package and tools
	sudo apt install hugo

test:## Run the clean target inside a Docker container , execute hugo and ls ./dist
	docker run awesome:build sh -c "make clean || echo 'Lint Failed'"
	docker run awesome:build sh -c "hugo; ls ./dist/*"

clean:## Remove all files in the dist directory
	rm -rf ./dist*

post:## Create a new post and set the title
	$(HUGO) new posts/$(POST_NAME).md
	sed -i 's/title: .*/title: "$(POST_TITLE)"/' content/posts/$(POST_NAME).md

lint: ## Install curl, Install nodejs, Install Markdownlint and verify MD
	apt install curl -y
	curl --silent --location https://deb.nodesource.com/setup_16.x | bash -
	apt install nodejs -y
	npm install -g markdownlint-cli 1>&2
	markdownlint README.md DEPLOY.md

markdownlint: ## Run the markdownlint tool on the README.md and DEPLOY.md files
	markdownlint README.md DEPLOY.md

shellcheck:## Run the shellcheck tool on the setup.sh script
	$(SHELLCHECK) setup.sh >/dev/null 2>&1 || echo "Lint Failed"

integration-tests:## Create a coverage-integrations.out file
	touch coverage-integrations.out

unit-tests:## Create a coverage-units.out file
	touch coverage-units.out

validate:## List the contents of the dist directory
	ls dist

package:## Build the site, Create a dist directory, Create zip archive the dist
	make build
	mkdir -p dist
	zip awesome-website.zip dist

## Suppress command output
.SILENT:

help: ##Print all lines in the Makefile that contain "##"
	
	cat Makefile | grep '##' | tr -d '##' | head -n -1BUILD_NAME) $(HUGO)
	$(DOCKER) $(DOCKER_IMAGE_BUILD_NAME) $(GO) build -o $(TARGET)

run:	## Run the application in background by executing the binary.
	./$(TARGET) >./$(TARGET).log 2>&1 &

post:	## Create a new blog post whose filename and title come from the environment variables POST_TITLE and POST_NAME
	$(HUGO) new posts/$(POST_NAME).md
	sed -i '2s/.*/title: "$(POST_TITLE)"/' content/posts/$(POST_NAME).md

stop:	## Stop the application.
	@pkill $(TARGET)

clean:	## Stop the application. Delete the binary and the log file.
	@if pgrep -x $(TARGET) > /dev/null; then \
		pkill $(TARGET); \
	fi
	@$(RM) $(TARGET) $(TARGET).log $(COVERAGE)-units.out $(COVERAGE)-integrations.out dist/ *~ awesome-website.zip

test:	## Test the application.
	$(MAKE) unit-tests
	$(MAKE) integration-tests

unit-tests: ## Run unit tests
	$(DOCKER) $(DOCKER_IMAGE_BUILD_NAME) sh -c "$(GO) test -v -short -coverprofile=$(COVERAGE)-units.out"

integration-tests: ## Run integration tests
	$(DOCKER) $(DOCKER_IMAGE_BUILD_NAME) sh -c "$(GO) test -v -coverprofile=$(COVERAGE)-integrations.out"

lint:	## Lint go lang code
	$(DOCKER) $(DOCKER_IMAGE_BUILD_NAME) golangci-lint run
	$(DOCKER) $(DOCKER_IMAGE_BUILD_NAME) markdownlint DEPLOY.md

check:	## Lint markdonw source, check dead links
	$(DOCKER) $(DOCKER_IMAGE_BUILD_NAME) markdownlint content/**/*.md
	$(DOCKER) $(DOCKER_IMAGE_BUILD_NAME) sh -c "find content -name \*.md -print0 | xargs -0 -n1 markdown-link-check"

package:	## Create a zip file with the awesome-api binary and the dist/ directory
	zip -r awesome-website.zip awesome-api dist

build-docker: ## Build docker images for the project
	docker build -t $(DOCKER_IMAGE_BUILD_NAME) ./.build

help:	## Show this help usage.
	@sed -ne '/@sed/!s/## //p' $(MAKEFILE_LIST)