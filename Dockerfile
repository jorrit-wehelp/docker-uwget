FROM golang:1.13-buster as build

RUN apt-get update && apt-get install -y --no-install-recommends upx-ucl && rm -rf /var/lib/apt/lists/*

USER nobody
RUN mkdir -p /go/src/project
WORKDIR /go/src/project
RUN echo "user:x:65534:65534:User:/:" > /go/src/project/passwd.minimal
ENV GOCACHE=/tmp/go-cache
RUN go mod init
RUN go get -v -ldflags "-s -w -linkmode external -extldflags -static" github.com/m-messiah/uwget@0.3
RUN upx /go/bin/uwget

FROM scratch
COPY --from=build /go/src/project/passwd.minimal /etc/passwd
COPY --from=build /go/bin/uwget /uwget
USER user
ENTRYPOINT ["/uwget"]
