FROM alpine:latest AS builder
WORKDIR /app
ARG VERSION
ARG TARGETPLATFORM

# Install basic shell and other necessary tools
RUN apk add --no-cache bash

# Copy the appropriate binary based on the target platform
COPY ./builds/PandoraHelper-${VERSION}-linux-amd64/PandoraHelper /app/PandoraHelper-amd64
COPY ./builds/PandoraHelper-${VERSION}-linux-arm64/PandoraHelper /app/PandoraHelper-arm64

# Select the correct binary based on TARGETPLATFORM and ensure it has execute permissions
RUN if [ "${TARGETPLATFORM}" = "linux/arm64" ]; then \
        cp /app/PandoraHelper-arm64 /app/PandoraHelper; \
    else \
        cp /app/PandoraHelper-amd64 /app/PandoraHelper; \
    fi && \
    chmod +x /app/PandoraHelper

FROM alpine:latest
WORKDIR /app

# Only copy the relevant binary from the builder stage
COPY --from=builder /app/PandoraHelper /app/PandoraHelper

# Ensure the binary is executable in case it's not preserved
RUN chmod +x /app/PandoraHelper

CMD ["/app/PandoraHelper"]
