# syntax = docker/dockerfile:1

########################################
## Build Stage
########################################
FROM golang:1.20.4-buster as builder

# add a label to clean up later
LABEL stage=intermediate

# setup the working directory
WORKDIR /test-auto

# install dependencies
ENV GO111MODULE=on
COPY ./go.sum ./go.sum
COPY ./go.mod ./go.mod

# Caching go mod download for local
RUN --mount=type=cache,target=/go/pkg/mod go mod download

# Remove netrc file
RUN rm -rf /root/.netrc

# add source code
COPY . .


ARG TARGETOS TARGETARCH
RUN --mount=type=cache,target=/go/pkg/mod \
    --mount=type=cache,target=/root/.cache/go-build \
    CGO_ENABLED=0 GOOS=$TARGETOS GOARCH=$TARGETARCH go build -cover -o test-auto-linux-amd64 ./cmd/

########################################
## Production Stage
########################################
FROM ubuntu:v1

# set working directory
WORKDIR /root
RUN mkdir -p ./coverage/test

ENV TZ Asia/Kolkata

# copy required files from builder
COPY --from=builder /test-auto/test-auto-linux-amd64 ./test-auto-linux-amd64

ENTRYPOINT ["./test-auto-linux-amd64"]