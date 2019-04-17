FROM docker:dind

ARG AWS_REGION='eu-west-1'
ARG AWS_KEY='changeme'
ARG AWS_SECRET='changeme'

RUN apk add --no-cache python3 && \
        python3 -m ensurepip && \
        rm -r /usr/lib/python*/ensurepip && \
        pip3 install --upgrade pip setuptools && \
        if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi && \
        if [[ ! -e /usr/bin/python ]]; then ln -sf /usr/bin/python3 /usr/bin/python; fi && \
        rm -r /root/.cache

RUN pip3 --no-cache-dir install --upgrade awscli

ENTRYPOINT ["entrypoint"]

