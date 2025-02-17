ARG BASE_IMAGE_NAME
FROM ${BASE_IMAGE_NAME}

VOLUME ["/app/inputs", "/app/experiments", "/app/results", "/app/weights"]
