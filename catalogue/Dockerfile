FROM node:20.19.5-alpine AS build
WORKDIR /opt/server
COPY package.json .
COPY *.js .
## this may add extra cache
RUN npm install

FROM node:20.19.5-alpine 
WORKDIR /opt/server
RUN addgroup -S roboshop && adduser -S roboshop -G roboshop
COPY --from=build /opt/server /opt/server
RUN chown -R roboshop:roboshop /opt/server
ENV MONGO="true" \
   MONGO_URL="mongodb://mongodb:27017/catalogue"
USER roboshop
CMD ["node","server.js"]










# FROM node:20
# WORKDIR /opt/server
# COPY package.json .
# COPY *.js .
# RUN npm install
# ENV MONGO="true" \
#    MONGO_URL="mongodb://mongodb:27017/catalogue"
# CMD ["node","server.js"]
