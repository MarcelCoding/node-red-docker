FROM node:14-alpine AS builder

RUN apk add --update --no-cache git \
 && git clone https://github.com/alphawerk/node-red-contrib-postgrestor.git \
 && cd node-red-contrib-postgrestor \
 && git checkout 72d0f4b8d387f07d0cc624dcfc985f77dce0780f \
 && npm pack

FROM nodered/node-red:1.2.9

# TODO: https://flows.nodered.org/collection/c8156f6276976bfb518d1e60442e01e2
# Treaefik: custom error pages, https://github.com/MarcelCoding/error-pages

COPY --from=builder ./node-red-contrib-postgrestor/*.tgz ./node-red-contrib-postgrestor.tgz

          # ui nodes
RUN npm i node-red-dashboard \
          node-red-node-ui-iframe \
          node-red-node-ui-lineargauge \
          node-red-node-ui-list \
          node-red-node-ui-microphone \
          node-red-node-ui-table \
          node-red-node-ui-vega \
          node-red-node-ui-webcam \
          node-red-node-ui-microphone \
          node-red-contrib-ui-media \
          node-red-contrib-ui-heatmap \
          node-red-contrib-ui-countdown-timer-switch \
          node-red-contrib-ui-time-scheduler \
          node-red-contrib-ui-clock \
          node-red-contrib-ui-state-trail \
          node-red-contrib-ui-svg \
          node-red-contrib-ui-value-trail \
          node-red-contrib-ui-level \
          node-red-contrib-ui-artless-gauge \
          node-red-contrib-ui-led \
          node-red-node-ui-table \
          # other nodes
          node-red-contrib-sun-position \
          node-red-contrib-light-scheduler \
          node-red-contrib-combine \
          node-red-node-openweathermap \
          node-red-node-random \
          node-red-node-feedparser \
        # node-red-node-serialport \
        # node-red-node-pi-gpio \
          node-red-node-ping \
          node-red-node-smooth \
          node-red-contrib-influxdb \
          ./node-red-contrib-postgrestor.tgz \
          node-red-node-mysql \
          node-red-contrib-bigtimer \
          node-red-contrib-moment \
          node-red-contrib-web-worldmap \
          node-red-contrib-aggregator \
          node-red-node-base64 \
          node-red-node-geofence \
          node-red-contrib-config \
          google-translate-tts \
          node-red-contrib-os \
          node-red-node-email \
          node-red-node-twitter \
          # node-red-node-discord @discordjs/uws \
          node-red-contrib-telegrambot \
          @node-red-contrib-themes/solarized-dark-grey

COPY settings.js /usr/src/node-red/settings.js
COPY healthcheck.js /healthcheck.js

CMD [ "--settings", "/usr/src/node-red/settings.js" ]
