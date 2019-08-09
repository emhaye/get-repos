FROM alpine:3.7

WORKDIR /src

COPY get-repos.sh .

RUN apk add --no-cache bash jq curl

ENTRYPOINT ["bash", "get-repos.sh"]