FROM alpine:edge

ARG AUUID="c8eac299-d04b-45b9-9cae-4f480737b5a3"
ARG CADDYIndexPage="https://raw.githubusercontent.com/caddyserver/dist/master/welcome/index.html"
ARG ParameterSSENCYPT="chacha20-ietf-poly1305"
ARG PORT=80

ADD etc/Caddyfile /tmp/Caddyfile
ADD etc/xray.json /tmp/xray.json
ADD deploy.sh /deploy.sh
ADD start.sh /start.sh

RUN apk update && \
    apk add --no-cache ca-certificates bash caddy tor unzip wget && \
    bash deploy.sh

RUN chmod +x /start.sh

CMD /start.sh
