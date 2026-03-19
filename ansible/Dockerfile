FROM debian:bookworm-slim

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       ansible \
       openssh-client \
       sshpass \
       python3 \
       python3-pip \
       curl \
       git \
       ca-certificates \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /ansible

CMD ["sleep", "infinity"]
