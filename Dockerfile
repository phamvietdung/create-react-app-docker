FROM alpine:3.14
FROM node:alpine

WORKDIR /home/app

RUN npm install -g http-server

COPY . .

RUN echo $(ls)

RUN npm install

RUN echo $(ls)

RUN npm run build

RUN echo $(ls)

RUN rm -rf /home/app/node_modules

RUN echo $(ls)

WORKDIR /home/app/build

RUN echo $(ls)

EXPOSE 3000

CMD [ "http-server",  "-p", "3000","--proxy", "http://localhost:3000?"]