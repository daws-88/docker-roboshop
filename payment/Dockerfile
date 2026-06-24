# Stage 1: Builder (Alpine
##----------------)
FROM python:3.9-alpine AS build
WORKDIR /opt/server
## uwsgi  pachages
RUN apk add --no-cache \
    build-base \
    linux-headers \
    pcre-dev
COPY payment.ini requirements.txt *.py /opt/server/
RUN pip3 install --prefix=/install -r requirements.txt


FROM python:3.9-alpine
WORKDIR /opt/server
RUN apk add --no-cache pcre
RUN addgroup -S roboshop && \
    adduser -S roboshop -G roboshop
EXPOSE 8080
ENV CART_HOST="cart" \
    CART_PORT="8080" \
    USER_HOST="user" \
    USER_PORT="8080" \
    AMQP_HOST="rabbitmq" \
    AMQP_USER="roboshop" \
    AMQP_PASS="roboshop123"
COPY --from=build /install /usr/local
COPY --from=build --chown=roboshop:roboshop payment.ini *.py requirements.txt /opt/servver /opt/server/
USER roboshop
ENTRYPOINT ["uwsgi","--ini","payment.ini"]

# WORKDIR /opt/server
# COPY payment.ini .
# COPY *.py .
# COPY requirements.txt .
# RUN pip3 install -r requirements.txt
# ENV CART_HOST="cart" \
#     CART_PORT="8080" \
#     USER_HOST="user" \
#     USER_PORT="8080" \
#     AMQP_HOST="rabbitmq" \
#     AMQP_USER="roboshop" \
#     AMQP_PASS="roboshop123"
# CMD ["uwsgi","--ini","payment.ini"]