FROM node:8

RUN apt-get update && apt-get install -y \
    python-dev \
    python-pip \
    python3-dev \
    python3-pip \
    zip \
    jq

RUN pip install awscli

CMD ["node"]
