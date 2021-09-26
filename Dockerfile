FROM alpine:3.10

LABEL version="2.0.0"
LABEL repository="https://github.com/anvil-solutions/Fast-FTP-Action"
LABEL homepage="https://github.com/anvil-solutions/Fast-FTP-Action"
LABEL maintainer="Domi04151309 <>"

LABEL "com.github.actions.name"="Fast FTP Action"
LABEL "com.github.actions.description"="Deploy your website via FTP"
LABEL "com.github.actions.icon"="upload-cloud"
LABEL "com.github.actions.color"="orange"

RUN apk update
RUN apk add openssh sshpass lftp

COPY entrypoint.sh /entrypoint.sh
RUN chmod 777 entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
