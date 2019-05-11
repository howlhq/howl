APP_NAME ?= `grep 'app:' mix.exs | sed -e 's/\[//g' -e 's/ //g' -e 's/app://' -e 's/[:,]//g'`
APP_VSN ?= "snapshot"
BUILD ?= `git rev-parse --short HEAD`

build:
	@docker build --build-arg APP_NAME=$(APP_NAME) \
		--build-arg APP_VSN=$(APP_VSN) \
		-t gcr.io/howlhq/$(APP_NAME):$(APP_VSN)-$(BUILD) \
		-t gcr.io/howlhq/$(APP_NAME):latest .
