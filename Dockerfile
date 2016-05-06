FROM alpine:latest
RUN apk add --update vsftpd && rm -rf /var/cache/apk/*
COPY startup.sh /
RUN chmod 777 /startup.sh
CMD ["/startup.sh"]
