FROM docker:dind

RUN apk -Uuv add groff less python py-pip \
    && pip3 install --upgrade pip \
    && apk --purge -v del py-pip \
    && rm /var/cache/apk/*

RUN pip3 --no-cache-dir install --upgrade awscli

