const http = require('http');
const https = require('https');
const settings = require('/settings.js');

process.env["NODE_TLS_REJECT_UNAUTHORIZED"] = 0;

const getHttp = () => settings.hasOwnProperty("https") ? https : http;
const exitCode = response =>
    response.statusCode >= 200 && response.statusCode < 500 ? 0 : 1;

const request = getHttp().request(
    {
      host: "localhost",
      port: settings.uiPort || 1880,
      timeout: 4000
    },
    response => process.exit(exitCode(response))
);

request.on('error', _ => process.exit(1));
request.end();
