ARG BASE_IMAGE_NAME=missing-build-argument
FROM ${BASE_IMAGE_NAME}

VOLUME ["/app/inputs", "/app/experiments", "/app/results", "/app/weights"]

LABEL org.opencontainers.image.description='Main Real-ESRGAN Image with CUDA support'
