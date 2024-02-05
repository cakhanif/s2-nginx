# Start from the official Nginx image
FROM nginx:alpine

LABEL io.openshift.s2i.scripts-url=image:///usr/libexec/s2i

# Install S2I
RUN apk add --no-cache curl \
    && curl -L https://github.com/openshift/source-to-image/releases/download/v1.3.1/source-to-image-v1.3.1-a5a77147-linux-amd64.tar.gz | tar -xz \
    && mv s2i /usr/local/bin

RUN chmod +x ./s2i/bin/*

# Copy the S2I scripts to /usr/libexec/s2i
COPY ./s2i/bin /usr/libexec/s2i

# Set the S2I scripts as the image entrypoint
ENTRYPOINT ["/usr/libexec/s2i/usage"]