const http = require('http');
const path = require('path');
const Tailor = require('node-tailor');
const fetchTemplate = require('node-tailor/lib/fetch-template');
const tailor = new Tailor({
    fetchTemplate: (req, parse) => {
        try {
            return fetchTemplate(path.join(process.cwd(), 'templates'))(req, parse);
        } catch (e) {
            console.error(e);
            return Promise.reject(e);
        }
    }
});
const server = http.createServer(tailor.requestHandler);
server.listen(process.env.PORT || 8080);
