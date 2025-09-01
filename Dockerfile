FROM golang:1.18 as build-env

WORKDIR /go/src/github.com/streamnative/pulsar-beat-output
ADD . /go/src/github.com/streamnative/pulsar-beat-output

ENV CGO_ENABLED=1
RUN go build -o /go/bin/filebeat github.com/streamnative/pulsar-beat-output/filebeat
RUN go build -o /go/bin/heartbeat github.com/streamnative/pulsar-beat-output/heartbeat
RUN go build -o /go/bin/metricbeat github.com/streamnative/pulsar-beat-output/metricbeat
RUN go build -o /go/bin/packetbeat github.com/streamnative/pulsar-beat-output/packetbeat
RUN go build -o /go/bin/auditbeat github.com/streamnative/pulsar-beat-output/auditbeat
RUN go build -o /go/bin/winlogbeat github.com/streamnative/pulsar-beat-output/winlogbeat

