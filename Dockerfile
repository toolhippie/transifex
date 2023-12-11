FROM ghcr.io/dockhippie/golang:1.21 AS build

# renovate: datasource=github-releases depName=transifex/cli
ENV TRANSIFEX_VERSION=1.6.10

RUN git clone -b v${TRANSIFEX_VERSION} https://github.com/transifex/cli.git /srv/app/src && \
  cd /srv/app/src && \
  GO111MODULE=on go install .

RUN ls -r /srv/app/*

FROM ghcr.io/dockhippie/alpine:3.19
ENTRYPOINT [""]

RUN apk update && \
  apk upgrade && \
  rm -rf /var/cache/apk/*

COPY --from=build /srv/app/bin/cli /usr/bin/tx
