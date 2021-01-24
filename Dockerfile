FROM nodered/node-red:latest
RUN npm i node-red-dashboard \
          node-red-node-ui-iframe node-red-node-ui-lineargauge node-red-node-ui-list node-red-node-ui-microphone node-red-node-ui-table node-red-node-ui-vega node-red-node-ui-webcam \
          node-red-contrib-sun-position \
          node-red-contrib-light-scheduler \
          node-red-node-email \
          node-red-contrib-combine \
          node-red-contrib-ui-time-scheduler \
          node-red-node-openweathermap \
          @node-red-contrib-themes/solarized-dark-grey

COPY settings.js /usr/src/node-red/settings.js
COPY healthcheck.js /healthcheck.js

CMD [ "--settings", "/usr/src/node-red/settings.js" ]
