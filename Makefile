TAG = v0.1.2
PREFIX = springmt

build: high_load_sample_server

high_load_sample_server: high_load_sample_server.go
	GOOS=linux GOARCH=arm64 go build -a -o high_load_sample_server high_load_sample_server.go

docker: high_load_sample_server
	docker build --pull -t ${PREFIX}/high_load_sample_server:$(TAG) .

push: docker
	docker push ${PREFIX}/high_load_sample_server:$(TAG)

clean:
	rm -rf high_load_sample_server
