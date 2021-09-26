FROM alpine:3.10

RUN apk update
RUN apk add openssh sshpass lftp

COPY entrypoint.sh /entrypoint.sh
RUN chmod 777 entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
