FROM golang:1.12.7-alpine3.10

ENV TERRAFORM_VERSION 0.12.5

RUN apk --update --no-cache add libc6-compat git openssh-client curl

RUN cd /usr/local/bin && \
    curl https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip -o terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip
    
RUN cd /usr/local/bin && \
    curl -L -o opa https://github.com/open-policy-agent/opa/releases/download/v0.12.1/opa_linux_amd64

RUN cd /usr/local/bin && \
    go get github.com/palantir/tfjson

WORKDIR /work
