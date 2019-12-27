FROM alpine:3.10

# Configuration variables
ENV HUGO_VERSION 0.40.1
ENV HUGO_BINARY hugo_${HUGO_VERSION}_Linux-64bit.tar.gz

RUN wget -qO /tmp/hugo.tar.gz \
    https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/${HUGO_BINARY} && \
    tar -zxf /tmp/hugo.tar.gz -C /usr/bin && \
    rm /tmp/hugo.tar.gz

VOLUME /site
WORKDIR /site

EXPOSE  1313

ENTRYPOINT ["hugo"]
