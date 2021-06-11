ARG ALPINE_VERSION=3.13

FROM alpine:${ALPINE_VERSION}

ARG AWS_CDK_VERSION=1.108.1
ARG USER_ID=1000
ARG GROUP_ID=1000

ENV CDK_USER=cdk

RUN apk -v --no-cache --update add \
        shadow \
        git \
        npm \
        python3 \
        py3-pip \
        && \
    rm -rf /var/cache/apk/* && \
    npm install -g "aws-cdk@$AWS_CDK_VERSION" && \
    groupadd -g "$GROUP_ID" "$CDK_USER" && \
    useradd -l -u "$USER_ID" -g "$CDK_USER" "$CDK_USER"

VOLUME [ "/home/${CDK_USER}/.aws" ]
VOLUME [ "/app" ]

RUN mkdir -p "/home/$CDK_USER" && chown -R "$CDK_USER:$CDK_USER" "/home/$CDK_USER"

USER "$CDK_USER"
WORKDIR /app

RUN git config --global user.email "cdk@localhost" && \
    git config --global user.name "cdk" && \
    git config --global init.defaultBranch master

CMD ["/bin/sh"]
