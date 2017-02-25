############################################################
# Dockerfile to run ${project}
# Based on Ubuntu
############################################################

FROM ubuntu:latest

MAINTAINER ${full_name} (${user})

ENV TINI_VERSION v0.14.0

WORKDIR /app/

ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /bin/tini
RUN chmod +x /bin/tini

COPY ./ /app/
RUN chmod -R 700 /app/

ENTRYPOINT ["tini", "--"]
CMD ["echo", "hello world"]
