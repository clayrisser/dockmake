############################################################
# Dockerfile to run ${project}
# Based on Ubuntu
############################################################

FROM ubuntu:latest

MAINTAINER ${full_name} (${user})

WORKDIR /app/

COPY ./ /app/
RUN chmod -R 700 /app/

ENTRYPOINT ["echo"]
CMD ["world"]
