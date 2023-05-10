build: ## Generate the website from the markdown and configuration files in the directory dist/
	markdownlint README.md content/posts/*
	markdown-link-check README.md content/posts/*
	hugo

post: ## Create a new blog post whose filename and title come from the environment variables POST_TITLE and POST_NAME
	hugo new posts/$(POST_NAME).md
	sed -i 's/title: .*/title:"$(POST_TITLE)"/' content/posts/$(POST_NAME).md

check: ## Succeed by default, and fail when presented with a dead link or a badly written Markdown file
	markdownlint README.md content/posts/*
	markdown-link-check README.md content/posts/*

validate: ## ## Always succeed by default and should print the result on the stdout
	python3 /opt/W3C-Validator/w3c_validator.py ./dist/index.html || true

run:	## Run the application in background by executing the binary and write log into a file
	./awesome-api >./awesome-api.log 2>&1 &

stop:	## Stop the application with the command pkill
	pkill awesome-api || true

clean:	## Stop the application and Delete the binary and log file
	pkill awesome-api || true
	rm -f awesome-api awesome-api.log coverage-*
	rm -rf dist/*

test:	## Test it to ensure that it behaves as expected
	go test -v -short -coverprofile=coverage-units.out
	go test -v -coverprofile=coverage-integrations.out

lint:	## 	Fail when the linter catches and error
	golangci-lint run

unit-tests:		## Execute (successfully) the Golang unit tests
	go test -v -short -coverprofile=coverage-units.out

integration-tests:	## Execute (successfully) the Golang integration-tests
	go test -v -coverprofile=coverage-integrations.out

help: ## Show help for each of the Makefile recipes.
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'build:	## Compile source code of the application to a binary
	golangci-lint run
	go build