# docker-vsftpd
Simple docker container for serving some directories over FTP.

## Usage:
```
docker run --name "my-ftp-server" -p 20 -p 21 -v ftpd.passwd:/etc/vsftpd/ftpd.passwd -v user_conf:/etc/vsftpd/user_conf -d cw1900/docker-vsftpd
```

## Configuration:
1. (required) use `htpasswd` to create/change/delete the FTP users using `ftpd.passwd`
2. (optional) create a file `user_conf/<username>` and add the following line: `local_root=/ftp/<username>` (otherwise the user has full access to `/ftp`)
