FROM alpine:latest AS builder
WORKDIR /app
ARG TARGETPLATFORM

# Copy the appropriate binary based on the target platform
COPY ./builds/PandoraHelper-main-linux-amd64/PandoraHelper /app/PandoraHelper-amd64
COPY ./builds/PandoraHelper-main-linux-arm64/PandoraHelper /app/PandoraHelper-arm64

# Choose the correct binary based on TARGETPLATFORM
RUN if [ "${TARGETPLATFORM}" = "linux/arm64" ]; then \
        cp /app/PandoraHelper-arm64 /app/PandoraHelper; \
    else \
        cp /app/PandoraHelper-amd64 /app/PandoraHelper; \
    fi

FROM alpine:latest
WORKDIR /app
ARG TARGETPLATFORM

# Only copy the relevant binary from the builder stage
COPY --from=builder /app/PandoraHelper /app/PandoraHelper

# Set executable permissions for the binary
RUN chmod +x /app/PandoraHelper

# Check the final structure of /app
RUN ls -lR /app

# First, try with a simple test to verify the Docker environment
CMD ["echo", "Hello, Docker!"]

# Once the above test works, you can comment out the echo and uncomment the next line to run your app
# CMD ["/app/PandoraHelper"]
