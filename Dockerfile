FROM golang:1.11 as golang

ADD . $GOPATH/github.com/lekspyl/logstash_exporter/
RUN cd $GOPATH/github.com/lekspyl/logstash_exporter && make

FROM busybox:1.27.2-glibc
COPY --from=golang /go/github.com/lekspyl/logstash_exporter/logstash_exporter /
LABEL maintainer lex.pilipenko@gmail.com
EXPOSE 9198
ENTRYPOINT ["/logstash_exporter"]  
