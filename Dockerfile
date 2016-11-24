FROM alpine:latest

RUN apk add --no-cache bash jq

COPY scripts/ /opt/resource/
RUN chmod +x /opt/resource/*
