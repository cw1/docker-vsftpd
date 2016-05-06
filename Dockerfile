FROM alpine:latest

RUN set -xe \
    && apk add --update build-base curl linux-pam-dev tar vsftpd \
    && mkdir -p pam_pwdfile \
      && cd pam_pwdfile \
      && curl -sSL https://github.com/tiwe-de/libpam-pwdfile/archive/v1.0.tar.gz | tar xz --strip 1 \
      && make install \
      && cd .. \
      && rm -rf pam_pwdfile \
    && apk del build-base curl linux-pam-dev tar \
    && passwd -l root \
    && adduser -D virtual \
    && rm -rf /var/cache/apk/*

RUN mkdir -p /ftp /etc/vsftpd/user_conf
COPY vsftpd.conf /etc/vsftpd/vsftpd.conf
COPY vsftpd /etc/pam.d/vsftpd
CMD ["vsftpd", "/etc/vsftpd/vsftpd.conf"]
