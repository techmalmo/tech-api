FROM golang:1.13 as builder
WORKDIR /go/src/github.com/techmalmo/tech-api/
ADD . /go/src/github.com/techmalmo/tech-api/
RUN CGO_ENABLED=0 GOOS=linux go build -o ./api /go/src/github.com/techmalmo/tech-api/main.go
FROM alpine:latest
RUN apk --no-cache add ca-certificates
RUN apk add --no-cache curl
COPY --from=builder /go/src/github.com/techmalmo/tech-api/api /app/
RUN addgroup --gid 3000 api
RUN adduser -h /app -s /bin/sh -G api -u 3000 -D api
RUN chown api:api -R /app
USER api
WORKDIR /app
ENTRYPOINT ["/app/api"]
