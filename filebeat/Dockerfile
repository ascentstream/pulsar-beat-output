FROM alpine:3.21 AS dist

COPY dist /app-dist/

RUN arch=$(uname -m) && \
    if [ "$arch" = "x86_64" ]; then \
        DIST_ARCH=linux-amd64; \
    elif [ "$arch" = "aarch64" ]; then \
        DIST_ARCH=linux-arm64; \
    else \
        echo "Unsupported architecture: $arch" && \
        exit 1; \
    fi && \
    mkdir /dist && \
    tar -xvf /app-dist/*$DIST_ARCH.tar.gz -C  /dist

FROM docker.elastic.co/beats/filebeat-oss:9.1.3

COPY --from=dist /dist/filebeat /usr/share/filebeat/filebeat
