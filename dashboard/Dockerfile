FROM node:current-alpine

# This image is for development only
RUN mkdir /app
WORKDIR /app
COPY package.json /app/package.json
COPY package-lock.json /app/package-lock.json
RUN npm install

COPY . /app
EXPOSE 8080
ENTRYPOINT [ "/usr/local/bin/npm", "run", "serve" ]
