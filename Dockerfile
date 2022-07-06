FROM golang AS builder

WORKDIR /app

RUN go mod init lorena/fullcycle

COPY . .

ENV CGO_ENABLED=0

RUN GOOS=linux go build hello.go

FROM scratch
WORKDIR /app
COPY --from=builder /app/hello .
CMD ["/app/hello"]


