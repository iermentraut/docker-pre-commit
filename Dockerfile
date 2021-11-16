ARG PYTHON_VERSION=3.8.10

FROM python:${PYTHON_VERSION}-alpine

ARG PRECOMMIT_VERSION=2.15.0

COPY . /

RUN \
    set -xe \
    && apk update \
    && apk add --no-cache \
      git=2.34.0-r0 \
      bash=5.1.8-r0 \
    && pip -q install --no-cache-dir \
      pre-commit==${PRECOMMIT_VERSION}

VOLUME [ "/src" ]

WORKDIR /src

ENTRYPOINT [ "/entrypoint.sh" ]

CMD [ "run" ]
