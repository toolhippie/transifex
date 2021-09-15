FROM webhippie/python:3.9
ENTRYPOINT [""]
ENV PY_COLORS=1

# renovate: datasource=pypi depName=transifex-client
ENV TRANSIFEX_VERSION=0.14.3

RUN apk update && \
  apk upgrade && \
  pip3 install -U transifex-client==${TRANSIFEX_VERSION} && \
  rm -rf /var/cache/apk/*
