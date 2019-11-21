FROM tesla3l337/raspbian-mini:buster
ARG VERSION
ENV TAG=$VERSION
COPY docker-entrypoint.sh /
RUN apt-get update && apt-get install -y curl gcc git libc-dev libgcc-6-dev make openssl python2.7-dev python3-pip zlib1g-dev libffi-dev
ENTRYPOINT ["/docker-entrypoint.sh"]
