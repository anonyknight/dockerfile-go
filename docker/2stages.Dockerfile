FROM --platform=$BUILDPLATFORM golang:1.21-alpine as builder
ARG TARGETARCH

WORKDIR /project

COPY src/hello-world.go ./

RUN CGO_ENABLED=0 GOOS=linux GOARCH=${TARGETARCH} go build -o /go/bin/hello-world.bin -v hello-world.go

FROM alpine:3.18

COPY --from=builder /go/bin/hello-world.bin /bin/hello-world.bin

RUN addgroup -g 1001 app && adduser -D -G app -u 1001 app
USER 1001

CMD ["/bin/hello-world.bin"]
