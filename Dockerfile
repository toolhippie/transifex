FROM webhippie/golang:1.18 AS build

# renovate: datasource=github-tags depName=transifex/cli
ENV TRANSIFEX_VERSION=v1.4.0

RUN git clone -b ${TRANSIFEX_VERSION} https://github.com/transifex/cli.git /srv/app/src && \
  cd /srv/app/src && \
  GO111MODULE=on go install .

RUN ls -r /srv/app/*

FROM webhippie/alpine:3.16
ENTRYPOINT [""]

RUN apk update && \
  apk upgrade && \
  rm -rf /var/cache/apk/*

COPY --from=build /srv/app/bin/cli /usr/bin/tx
