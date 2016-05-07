# docker-vsftpd
Simple docker container for serving some directories over FTP.

## Installation:
```
docker run --name "vsftpd" --restart always -p 20-21:20-21 -p 10090-10100:10090-10100 -v ftpd.passwd:/etc/vsftpd/ftpd.passwd -v user_data:/ftp -d cw1900/docker-vsftpd
```

## Usage:

All of the following commands should be executed on the host!

### Create a new user:
```
htpasswd -d ftpd.passwd <username>
mkdir -p user_data/<username>
```
The user will be automatically chrooted to `/ftp/<username>`.

### Change a users password:
```
htpasswd -d ftpd.passwd <username>
```

### Delete a user:
```
htpasswd -D <username>
rm -r user_data/<username>
```
