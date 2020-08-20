## Stage 1
FROM alpine/git
COPY . /data
WORKDIR /data
RUN rm -rf ansible-playbooks

## Stage 2
FROM alpine:3.12@sha256:a15790640a6690aa1730c38cf0a440e2aa44aaca9b0e8931a9f2b0d7cc90fd65
LABEL description="Docker container for building my static hugo site."
LABEL maintainer="Noel Miller <noelmiller@protonmail.com>"

# config
ENV HUGO_VERSION=0.74.3
ENV HUGO_TYPE=Linux-64bit.tar.gz
ENV HUGO_ID=hugo_${HUGO_VERSION}_${HUGO_TYPE}

RUN wget -O - https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/${HUGO_ID} | tar -xz -C /tmp \
    && mkdir -p /usr/local/sbin \
    && mv /tmp/hugo /usr/local/sbin/hugo \
    && rm -rf /tmp/${HUGO_ID} \
    && rm -rf /tmp/LICENSE.md \
    && rm -rf /tmp/README.md

COPY --from=0 /data /data
WORKDIR /data
RUN hugo

## Stage 3

FROM golang:1.15-alpine
RUN go version

RUN apk add --update --update-cache --no-cache \
    git \
    ca-certificates && \
    go get github.com/tdewolff/minify/cmd/minify && \
    apk del --update --update-cache --no-cache \
    git \
    ca-certificates

COPY --from=1 /data/public /data/public
WORKDIR /data
RUN minify --recursive --verbose \
        --match=\.*.js$ \
        --type=js \
        --output public/ \
        public/

RUN minify --recursive --verbose \
        --match=\.*.css$ \
        --type=css \
        --output public/ \
        public/

RUN minify --recursive --verbose \
        --match=\.*.html$ \
        --type=html \
        --output public/ \
        public/

## Stage 4

FROM nginx:alpine
COPY --from=2 /data/public /usr/share/nginx/html

EXPOSE 80/tcp
