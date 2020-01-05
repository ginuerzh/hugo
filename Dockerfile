FROM alpine:3.10

# Configuration variables
ENV HUGO_VERSION 0.62.1
ENV HUGO_BINARY hugo_extended_${HUGO_VERSION}_Linux-64bit.tar.gz

RUN wget -qO /tmp/hugo.tar.gz \
    https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/${HUGO_BINARY} && \
    tar -zxf /tmp/hugo.tar.gz -C /usr/bin && \
    rm /tmp/hugo.tar.gz

# libc6-compat & libstdc++ are required for extended SASS libraries
# ca-certificates are required to fetch outside resources (like Twitter oEmbeds)
RUN apk update && \
    apk add --no-cache ca-certificates libc6-compat libstdc++

VOLUME /site
WORKDIR /site

# Expose port for live server
EXPOSE  1313

ENTRYPOINT ["hugo"]
