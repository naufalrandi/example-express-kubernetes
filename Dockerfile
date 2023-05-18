FROM node:14-alpine as examplekube

# Create app directory
WORKDIR /usr/src/app

RUN apk add g++ make py3-pip
RUN apk add git
RUN apk add nano
RUN apk add tzdata
RUN cp /usr/share/zoneinfo/Asia/Jakarta /etc/localtime
RUN echo "Asia/Jakarta" >  /etc/timezone
RUN date

RUN rm -rf node_modules package-lock.json

COPY package*.json ./
RUN yarn install

COPY . .

EXPOSE 3000

CMD [ "npm", "start" ]