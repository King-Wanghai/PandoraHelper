FROM alpine:latest AS builder
WORKDIR /app
ARG VERSION
ARG TARGETPLATFORM

# Copy the appropriate binary based on the target platform
COPY ./builds/PandoraHelper-${VERSION}-linux-amd64/PandoraHelper /app/PandoraHelper-amd64

cp /app/PandoraHelper-amd64 /app/PandoraHelper;

FROM alpine:latest
WORKDIR /app
ARG TARGETPLATFORM

# Only copy the relevant binary from the builder stage
COPY --from=builder /app/PandoraHelper /app/PandoraHelper

CMD ["/app/PandoraHelper"]
