# docker-vsftpd
Simple docker container for serving some directories over FTP.

## Usage:
```
docker run --name "my-ftp-server" -p 20:20 -p 21:21 -v ftpd.passwd:/etc/vsftpd/ftpd.passwd -v user_conf:/etc/vsftpd/user_conf -d cw1900/docker-vsftpd
```

## Configuration:
Use `htpasswd` to create/change/delete the FTP users using `ftpd.passwd`.
The user will be automatically chrooted to `/ftp/<username>` (don't forget to add `-v user_data:/ftp/<username>` to the command above)
