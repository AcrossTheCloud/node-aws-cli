FROM node:8

RUN apt-get update && apt-get install -y \
    python-dev \
    python-pip \
    zip \
    jq

RUN pip install awscli

CMD ["node"]
