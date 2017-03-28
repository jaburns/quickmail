FROM alpine

RUN apk add --update bash socat ssmtp
RUN rm -rf /var/cache/apk/*

COPY startup /root/
COPY server /root/

EXPOSE 80
CMD ["/root/startup"]
