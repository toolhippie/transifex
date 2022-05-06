FROM webhippie/alpine:3.15
ENTRYPOINT [""]
ENV PY_COLORS=1

# renovate: datasource=pypi depName=transifex-client
ENV TRANSIFEX_VERSION=0.14.4

RUN apk update && \
  apk upgrade && \
  apk add git python3 python3-dev py3-pip && \
  pip3 install -U transifex-client==${TRANSIFEX_VERSION} && \
  rm -rf /var/cache/apk/* /root/.cache
