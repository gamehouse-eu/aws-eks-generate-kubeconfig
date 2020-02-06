FROM alpine:3.6
RUN apk -v --update add \
        python \
        py-pip \
        groff \
        less \
        mailcap \
        && \
    pip install --upgrade awscli==1.17.1 s3cmd==2.0.1 python-magic && \
    apk -v --purge del py-pip && \
    rm /var/cache/apk/*
VOLUME /root/.aws
VOLUME /project
RUN mkdir /scripts
COPY entrypoint.sh /scripts/entrypoint.sh
ENTRYPOINT ["sh","/scripts/entrypoint.sh"]
