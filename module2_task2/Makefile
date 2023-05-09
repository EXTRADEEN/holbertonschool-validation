GO=go
TARGET=awesome-api
RM=rm -f
MAKE=make

lint: 	## Should fail when the linter catches and error
	golangci-lint run
	
build:	## Generate the source code of the application to a binary.
	$(MAKE) lint
	$(GO) mod tidy
	$(GO) build -o $(TARGET)
	
run:	## Run the application in background by executing the binary.
	./$(TARGET) >./$(TARGET).log 2>&1 &

stop:	## Stop the application.
	@pkill $(TARGET)

clean:	## Stop the application. Delete the binary and the log file.
	@if pgrep -x $(TARGET) > /dev/null; then \
		pkill $(TARGET); \
	fi
	@$(RM) $(TARGET) $(TARGET).log

test:	## Test the application.
	@curl http://localhost:9999 http://localhost:9999/health

unit-tests: ## Unit test for application
	go test -v -short -coverprofile=coverage-units.out

help:	## Show this help usage.
	@sed -ne '/@sed/!s/## //p' $(MAKEFILE_LIST)