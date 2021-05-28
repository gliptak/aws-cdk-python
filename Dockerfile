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
    pip install "aws_cdk.core==$AWS_CDK_VERSION" && \
    npm install -g "aws-cdk@$AWS_CDK_VERSION" && \
    groupadd -g 1000 "$CDK_USER" && \
    useradd -l -u 1000 -g "$CDK_USER" -G users "$CDK_USER"

VOLUME [ "/home/${CDK_USER}/.aws" ]
VOLUME [ "/app" ]

# Allow for caching user python modules
VOLUME ["/home/${CDK_USER}/.local/lib/python3.8/site-packages"]

RUN mkdir -p "/home/$CDK_USER" && chown -R "$CDK_USER:$CDK_USER" "/home/$CDK_USER"

USER "$CDK_USER"
WORKDIR /app

RUN git config --global user.email "cdk@localhost" && \
    git config --global user.name "cdk" && \
    git config --global init.defaultBranch master

CMD ["/bin/sh"]
