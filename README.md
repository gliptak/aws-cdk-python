# AWS Cloud Development Kit (AWS CDK) Python Docker Container

[![Build Docker image](https://github.com/gliptak/aws-cdk-python/actions/workflows/ci.yml/badge.svg?branch=master)](https://github.com/gliptak/aws-cdk-python/actions/workflows/ci.yml?branch=master)
## Docker packages

https://hub.docker.com/r/gliptak/aws-cdk-python

https://github.com/users/gliptak/packages/container/package/aws-cdk-python

## Usage

Following https://docs.aws.amazon.com/cdk/latest/guide/hello_world.html 

```
docker run -v ~/.aws:/home/cdk/.aws -v $(pwd):/app --rm -it gliptak/aws-cdk-python:latest
```

Run commands in container

```
cdk init app --language python
source .venv/bin/activate
python -m pip install -r requirements.txt
```

```
cdk ls
cdk synth
```

```
export AWS_PROFILE=myprofile

cdk bootstrap

cdk deploy
cdk diff
cdk destroy
```

## Notes

https://jtreminio.com/blog/running-docker-containers-as-current-host-user/

https://medium.com/redbubble/running-a-docker-container-as-a-non-root-user-7d2e00f8ee15

https://github.com/moby/moby/issues/34129

https://docs.docker.com/engine/reference/builder/#understand-how-arg-and-from-interact

https://docs.aws.amazon.com/cdk/latest/guide/tagging.html

https://docs.github.com/en/actions/guides/publishing-docker-images

https://github.com/opencontainers/image-spec/blob/master/annotations.md

https://github.com/marketplace/actions/publish-docker-image
