FROM --platform=$BUILDPLATFORM golang:latest AS builder
WORKDIR /tmp
COPY ./high_load_sample_server.go /tmp
ARG TARGETOS TARGETARCH
RUN GOOS=$TARGETOS GOARCH=$TARGETARCH CGO_ENABLED=0 go build -a -o high_load_sample_server high_load_sample_server.go

FROM alpine:latest
WORKDIR /
COPY --from=builder /tmp/high_load_sample_server /bin/
CMD ["/bin/high_load_sample_server"]

