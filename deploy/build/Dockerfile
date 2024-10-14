FROM alpine:latest AS builder
WORKDIR /app

# Copy the appropriate binary based on the target platform
COPY ./builds/PandoraHelper-main-linux-linux-arm64/PandoraHelper /app/PandoraHelper-arm64

RUN cp /app/PandoraHelper-arm64 /app/PandoraHelper;

FROM alpine:latest
WORKDIR /app
ARG TARGETPLATFORM

# Only copy the relevant binary from the builder stage
COPY --from=builder /app/PandoraHelper /app/PandoraHelper

CMD ["/app/PandoraHelper"]
