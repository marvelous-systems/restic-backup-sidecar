FROM golang:latest as buildenv
WORKDIR /go/src/github.com/restic/
RUN git clone https://github.com/restic/restic
WORKDIR /go/src/github.com/restic/restic
RUN go version
RUN go run build.go --goos linux --goarch amd64

FROM alpine:latest as runtime
WORKDIR /restic
RUN touch /restic/log
COPY --from=buildenv /go/src/github.com/restic/restic/restic /restic/restic
COPY crontab /etc/crontab
COPY scripts/ /restic/

ENTRYPOINT ["/restic/entrypoint.sh"]