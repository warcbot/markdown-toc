FROM golang:1-alpine as builder

RUN apk add --no-cache build-base git

WORKDIR /go/src/github.com/sebdah/markdown-toc

ADD . .

RUN go install github.com/sebdah/markdown-toc@latest

FROM alpine:3.13

COPY --from=builder /go/bin/markdown-toc /usr/local/bin

ENTRYPOINT ["markdown-toc"]
