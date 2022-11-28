FROM node:lts-alpine
# instalando  http-server y json-server (bd)
RUN npm install -g http-server
RUN npm install -g json-server
WORKDIR /app
COPY package*.json ./
# instalando dependencias
RUN npm install
COPY . .
# build app for production with minification
RUN npm run build
EXPOSE 8080
CMD [ "http-server","json-server", "dist" ]
