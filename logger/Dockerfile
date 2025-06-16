FROM alpine:latest

RUN apk add --no-cache bash

COPY logger.sh /logger.sh

RUN chmod +x /logger.sh

VOLUME /logs

CMD ["/logger.sh"]
