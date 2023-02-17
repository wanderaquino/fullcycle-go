FROM golang:1.20.1-alpine3.17 AS build

WORKDIR /go/src
COPY    /src/hello.go /go/src

RUN     go mod init fullcycle && \
        go build

FROM scratch

WORKDIR /go/src

COPY --from=build /go/src .

ENTRYPOINT ["./fullcycle"]