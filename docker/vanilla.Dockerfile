# This is obsolete docker because it's too large.
FROM golang:1.21

WORKDIR /usr/src

COPY src .
RUN go build -o ./hello-world.bin hello-world.go

CMD ["./hello-world.bin"]
