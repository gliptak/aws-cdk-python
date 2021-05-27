ARG ALPINEVERSION=3.13

FROM alpine:${ALPINEVERSION}

ARG AWS_CDK_VERSION=1.105.0
ARG CDK_USER=cdk

RUN apk -v --no-cache --update add \
        shadow \
        git \
        npm \
        python3 \
        py3-pip \
        && \
    git config --global user.email "root@localhost" && \
    git config --global init.defaultBranch master && \
    pip install "aws_cdk.core==$AWS_CDK_VERSION" && \
    npm install -g "aws-cdk@$AWS_CDK_VERSION"

RUN echo foo "$CDK_USER"
RUN groupadd -g 1000 "$CDK_USER"
RUN useradd -l -u 1000 -g "$CDK_USER" -G users "$CDK_USER"

VOLUME [ "/home/${CDK_USER}/.aws" ]
VOLUME [ "/app" ]

# Allow for caching user python modules
VOLUME ["/home/${CDK_USER}/.local/lib/python3.8/site-packages"]

USER "$CDK_USER"
WORKDIR /app

ENTRYPOINT ["cdk"]
