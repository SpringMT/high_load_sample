FROM golang:latest AS builder
WORKDIR /tmp
COPY ./high_load_sample_server.go /tmp
RUN GOOS=linux GOARCH=arm64 go build -a -o high_load_sample_server high_load_sample_server.go

FROM arm64v8/alpine:latest
COPY --from=builder /tmp/high_load_sample_server ./
RUN chmod +x high_load_sample_server
CMD ["./high_load_sample_server"]

