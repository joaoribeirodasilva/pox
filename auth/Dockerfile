FROM golang:1.21-alpine as builder

WORKDIR /app 

COPY . . /app/

RUN go build -o /app/auth

FROM scratch 

COPY --from=builder /app/auth /app/auth 

ENTRYPOINT [ "/app/auth" ]