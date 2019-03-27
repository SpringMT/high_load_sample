FROM golang:1.11-alpine

ADD high_load_sample_server high_load_sample_server

RUN chmod +x high_load_sample_server

CMD ["./high_load_sample_server"]
