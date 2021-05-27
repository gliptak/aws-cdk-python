ARG ALPINE_VERSION=3.13
ARG AWS_CDK_VERSION=1.105.0
FROM alpine:${ALPINE_VERSION}

RUN apk -v --no-cache --update add \
        nodejs \
        npm \
        python3 \
        ca-certificates \
        groff \
        less \
        bash \
        make \
        curl \
        wget \
        zip \
        git \
        && \
    update-ca-certificates && \
    git config --global user.email "root@localhost" && \
    git config --global init.defaultBranch master && \
    npm install -g aws-cdk@${AWS_CDK_VERSION}

VOLUME [ "/root/.aws" ]
VOLUME [ "/app" ]

# Allow for caching python modules
VOLUME ["/usr/lib/python3.8/site-packages/"]

WORKDIR /opt/app

ENTRYPOINT ["cdk"]
