FROM tesla3l337/alpine:armhf
ARG VERSION
ENV TAG=$VERSION

COPY docker-entrypoint.sh /
RUN apk add --no-cache \
    bash \
    build-base \
    ca-certificates \
    curl \
    gcc \
    git \
    libc-dev \
    libffi-dev \
    libgcc \
    make \
    musl-dev \
    openssl \
    openssl-dev \
    python2 \
    python2-dev \
    zlib-dev \
    py-pip
ENTRYPOINT ["/docker-entrypoint.sh"]
