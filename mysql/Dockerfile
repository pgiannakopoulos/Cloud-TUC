ARG MYSQL_VERSION=""
FROM mysql:${MYSQL_VERSION:-latest}

ADD init.sql /docker-entrypoint-initdb.d