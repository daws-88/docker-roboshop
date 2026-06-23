FROM node:20.19.5-alpine AS build
WORKDIR /opt/server
COPY package.json .
COPY *.js .
## this may add extra cache
RUN npm install


FROM node:20.19.5-alpine
WORKDIR /opt/server
RUN addgroup -S roboshop && adduser -S roboshop -G roboshop &&  \
    chown -R roboshop:roboshop /opt/server
ENV REDIS_URL=REDIS_HOST="redis" \
     CATALOGUE_HOST="catalogue" \
     CATALOGUE_PORT="8080"
EXPOSE 8080
LABEL com.project="roboshop" \
       trainer="venkatsai"
COPY --from=build --chown=roboshop:roboshop /opt/server /opt/server
USER roboshop
CMD ["server.js"]
ENTRYPOINT ["node"]











# FROM node:20
# WORKDIR /opt/server
# COPY package.json .
# COPY *.js .
# RUN npm install
# ENV REDIS_URL=REDIS_HOST="redis" \
#      CATALOGUE_HOST="catalogue" \
#      CATALOGUE_PORT="8080"
# CMD ["node", "server.js"]