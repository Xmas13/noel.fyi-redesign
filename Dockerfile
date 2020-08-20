## Stage 1
## Pulling down base alpine docker container, copying hugo files, downloading and installing hugo,
## and running hugo to produce public files
FROM alpine:3.12@sha256:a15790640a6690aa1730c38cf0a440e2aa44aaca9b0e8931a9f2b0d7cc90fd65
LABEL description="Docker container for building my static hugo site."
LABEL maintainer="Noel Miller <noelmiller@protonmail.com>"

# config
ENV HUGO_VERSION=0.74.3
ENV HUGO_TYPE=Linux-64bit.tar.gz
ENV HUGO_ID=hugo_${HUGO_VERSION}_${HUGO_TYPE}
COPY . /data
WORKDIR /data

# download and install hugo
RUN wget -O - https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/${HUGO_ID} | tar -xz -C /tmp \
    && mkdir -p /usr/local/sbin \
    && mv /tmp/hugo /usr/local/sbin/hugo \
    && rm -rf /tmp/${HUGO_ID} \
    && rm -rf /tmp/LICENSE.md \
    && rm -rf /tmp/README.md

RUN hugo

# Removing extraneous files
RUN rm -rf ansible-playbooks/ assets/ content/ static/ .gitignore/ .gitmodules/ config.toml/ Dockerfile/

## Stage 2
## Pull down latest go image, download minify command line utility to minify web files
FROM golang:1.15-alpine

RUN apk add --update --update-cache --no-cache \
    git \
    ca-certificates && \
    go get github.com/tdewolff/minify/cmd/minify && \
    apk del --update --update-cache --no-cache \
    git \
    ca-certificates

COPY --from=0 /data/public /data/public
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
## Pull latest nginx image for alpine and serve on port 80

FROM nginx:alpine
COPY --from=1 /data/public /usr/share/nginx/html

EXPOSE 80/tcp
