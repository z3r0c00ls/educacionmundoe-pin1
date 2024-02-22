FROM node:11.1.0-alpine

WORKDIR /app

ADD package.json package-lock.json /app/
RUN npm install

EXPOSE 3000

ADD . /app

# Modificamos el comando para que la aplicación escuche en todas las interfaces de red
CMD ["node", "index", "0.0.0.0"]
