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

ENV BASE_URL="https://get.helm.sh"

ENV HELM_3_FILE="helm-v3.0.3-linux-amd64.tar.gz"

RUN apk add --no-cache ca-certificates jq curl bash nodejs && \
    # Install helm version 3:
    curl -L ${BASE_URL}/${HELM_3_FILE} |tar xvz && \
    mv linux-amd64/helm /usr/bin/helm && \
    chmod +x /usr/bin/helm && \
    rm -rf linux-amd64

RUN helm version

VOLUME /root/.aws
VOLUME /project
RUN mkdir /scripts
COPY entrypoint.sh /scripts/entrypoint.sh
ENTRYPOINT ["sh","/scripts/entrypoint.sh"]
