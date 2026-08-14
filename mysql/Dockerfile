# FROM mysql:8.0
# COPY db/ /docker-entrypoint-initdb.d
# ENV MYSQL_ROOT_PASSWORD="RoboShop@1"

## as a part k8 init-containers
FROM mysql:8.0
COPY db/ /docker-entrypoint-initdb.d
COPY custom-script.sh /usr/loca;/bin/custom-script.sh
RUN chmod +x /usr/loca;/bin/custom-script.sh
ENTRYPOINT [ "/usr/loca;/bin/custom-script.sh" ]