TARGET=pwndrop
BUILD_DIR=./build

.PHONY: all
all: build

build:
	@echo "*** building..."
	@go build -ldflags="-s -w" -o $(BUILD_DIR)/$(TARGET)
	@rm -rf $(BUILD_DIR)/admin
	@echo "*** copying new admin panel"
	@cp -r ./www $(BUILD_DIR)/admin
	@chmod 700 $(BUILD_DIR)/pwndrop

clean:
	@go clean
	@rm -rf ./build/

install:
	@echo "*** stopping pwndrop"
	-@$(BUILD_DIR)/$(TARGET) stop
	@echo "*** installing and starting pwndrop"
	@$(BUILD_DIR)/$(TARGET) install && $(BUILD_DIR)/$(TARGET) start
	@$(BUILD_DIR)/$(TARGET) status
