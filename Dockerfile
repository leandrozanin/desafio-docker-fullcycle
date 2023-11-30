FROM golang:1.21.4-alpine3.18 as prebuilder

WORKDIR /usr/src/app

COPY ./project/ .

RUN go build -o ./build/main main.go

FROM scratch

WORKDIR /usr/src/app

COPY --from=prebuilder /usr/src/app/build/ .

CMD ["./main"]