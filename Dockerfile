FROM matthewberryman/postgresql
USER root
RUN service postgresql stop
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    python-dev \
    python-pip \
    zip \
    jq \
    git

FROM node:8

# copy everything from previous step
COPY --from=0 / /
# fix ownership and permissions
RUN chown -R postgres /var/lib/postgresql /var/run/postgresql /etc/postgresql /etc/ssl/private /var/log/postgresql
RUN chmod 0600 /etc/ssl/private/ssl-cert-snakeoil.key

RUN pip install awscli

ENV PGUSER docker
ENV PGPASSWORD docker

CMD ["/bin/bash"]
