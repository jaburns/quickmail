FROM debian:jessie

RUN apt-get update && apt-get install -y \
    ssmtp socat

COPY startup /root/
COPY server /root/

EXPOSE 80
CMD ["/root/startup"]
