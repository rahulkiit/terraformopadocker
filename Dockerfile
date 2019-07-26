FROM golang:1.12.7-alpine3.10

ENV TERRAFORM_VERSION 0.12.5

RUN apk --update --no-cache add libc6-compat git openssh-client curl

RUN cd /usr/local/bin && \
    curl https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip -o terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip

COPY opa /usr/local/bin

RUN cd /usr/local/bin && \
    go get github.com/palantir/tfjson

WORKDIR /work
