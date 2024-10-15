# Build stage
FROM alpine:latest AS builder
WORKDIR /app

# Copy the amd64 binary
COPY ./builds/PandoraHelper-main-linux-amd64/PandoraHelper /app/PandoraHelper

# Final image
FROM alpine:latest
WORKDIR /app

# Copy the relevant binary from the builder stage
# COPY --from=builder /app/PandoraHelper /app/PandoraHelper

# Set executable permissions for the binary
# RUN chmod +x /app/PandoraHelper

# Check the final structure of /app
RUN ls -a

# Run the binary
CMD ["/app/PandoraHelper"]
