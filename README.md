### quickmail

Simple docker image for sending email notifications through an HTTP interface.
Uses socat + bash to create a tiny server to proxy emails through ssmtp.

Example startup using gmail account
```
docker build -t quickmail .
docker run -itd \
    -e EMAIL=server_bot@gmail.com \  # Replace this with a gmail account you control
    -e PASSWORD=xxx               \  # Password for the account
    -e MAILHUB=smtp.gmail.com:587 \  # This is the default value, can leave out if using gmail
    -p 8888:80                    \  # The app runs on port 80 inside the container
    quickmail
```
Troubleshooting gmail SMTP not working: http://serverfault.com/questions/635139/how-to-fix-send-mail-authorization-failed-534-5-7-14

Usage example with curl
```
curl -X POST --data-binary @- http://localhost:8888/target@email.com <<EOF
From: Server Bot
Subject: Notification

Hello, this is a notification!
EOF
```
