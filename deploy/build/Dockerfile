FROM alpine:latest AS builder
WORKDIR /app
ARG VERSION
ARG TARGETPLATFORM

# 动态选择要复制的二进制文件
RUN case "${TARGETPLATFORM}" in \
        "linux/amd64") BINARY_PATH="builds/PandoraHelper-${VERSION}-linux-amd64/PandoraHelper" ;; \
        "linux/arm64") BINARY_PATH="builds/PandoraHelper-${VERSION}-linux-arm64/PandoraHelper" ;; \
        *) echo "Unsupported platform: ${TARGETPLATFORM}" && exit 1 ;; \
    esac && \
    cp $BINARY_PATH /app/PandoraHelper

FROM alpine:latest
WORKDIR /app
ARG TARGETPLATFORM

# Only copy the relevant binary from the builder stage
COPY --from=builder /app/PandoraHelper /app/PandoraHelper

CMD ["/app/PandoraHelper"]
