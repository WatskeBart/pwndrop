FROM golang:1.23.3-alpine as builder

WORKDIR /app

COPY . /app

RUN apk update && apk add make && make build

FROM alpine:3.20.3

WORKDIR /pwndrop

COPY --from=builder /app/build/ /pwndrop/

RUN apk --no-cache update

EXPOSE 80
EXPOSE 443
EXPOSE 53/udp
EXPOSE 53/tcp