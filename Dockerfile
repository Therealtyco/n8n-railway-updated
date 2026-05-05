FROM n8nio/n8n:latest

USER root

ENV PUPPETEER_CACHE_DIR=/opt/puppeteer-cache

RUN npx --yes puppeteer browsers install chrome

RUN find /opt/puppeteer-cache -name "chrome" -type f | head -1 | xargs -I{} ln -sf {} /usr/local/bin/chromium

ENV PUPPETEER_EXECUTABLE_PATH=/usr/local/bin/chromium
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true

USER node
