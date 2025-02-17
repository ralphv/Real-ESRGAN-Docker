IMAGE_NAME ?= ralphv/realesrgan

BASE_IMAGE_NAME := $(IMAGE_NAME)-base
MAIN_IMAGE_NAME := $(IMAGE_NAME)
MAIN_WITH_MODELS_IMAGE_NAME := $(IMAGE_NAME)-with-models

.PHONY: build
build:
	docker build -f docker/base.Dockerfile -t $(BASE_IMAGE_NAME) .
	docker build -f docker/main.Dockerfile --build-arg BASE_IMAGE_NAME=$(BASE_IMAGE_NAME) -t $(MAIN_IMAGE_NAME) .
	docker build -f docker/mainWithModels.Dockerfile --build-arg BASE_IMAGE_NAME=$(BASE_IMAGE_NAME) -t $(MAIN_WITH_MODELS_IMAGE_NAME) .

run:
	docker run --gpus all \
    		-v $(PWD)/input:/input \
    		-v $(PWD)/output:/output \
    		$(IMAGE_NAME)-with-models \
    		-i /input/$(INPUT) -o /output --fp32 --face_enhance -s 2

