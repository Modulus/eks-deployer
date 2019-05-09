FROM alpine:3.8

   # && openssl sha1 -sha256 aws-iam-authenticator && chmod +x ./aws-iam-authenticator \

RUN apk add curl && curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.14.0/bin/linux/amd64/kubectl \
    && chmod +x ./kubectl \
    && mv ./kubectl /usr/local/bin/kubectl \
    && curl -o aws-iam-authenticator https://amazon-eks.s3-us-west-2.amazonaws.com/1.12.7/2019-03-27/bin/linux/amd64/aws-iam-authenticator \
    && curl -o aws-iam-authenticator.sha256 https://amazon-eks.s3-us-west-2.amazonaws.com/1.12.7/2019-03-27/bin/linux/amd64/aws-iam-authenticator.sha256 \
    && chmod +x ./aws-iam-authenticator &&  mv ./aws-iam-authenticator /usr/local/bin/aws-iam-authenticator \
    && apk add python3 && pip3 install awscli --upgrade --user

COPY . .


ENTRYPOINT [ "aws-iam-authenticator" ]