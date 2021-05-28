# publish-image

## Docker packages

https://github.com/gliptak?tab=packages

## Usage

Following https://docs.aws.amazon.com/cdk/latest/guide/hello_world.html 

docker run -v ~/.aws:/home/cdk/.aws -v $(pwd):/app --rm -it gliptak/publish-image:latest

cdk init app --language python
source .venv/bin/activate
python -m pip install -r requirements.txt

cdk ls
cdk synth

export AWS_PROFILE=myprofile

cdk bootstrap

cdk deploy
cdk diff
cdk destroy

## References

https://jtreminio.com/blog/running-docker-containers-as-current-host-user/

https://medium.com/redbubble/running-a-docker-container-as-a-non-root-user-7d2e00f8ee15

https://github.com/moby/moby/issues/34129

https://docs.docker.com/engine/reference/builder/#understand-how-arg-and-from-interact

https://docs.aws.amazon.com/cdk/latest/guide/tagging.html

https://docs.github.com/en/actions/guides/publishing-docker-images

https://github.com/opencontainers/image-spec/blob/master/annotations.md

https://github.com/marketplace/actions/publish-docker-image


