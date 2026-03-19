FROM debian:bookworm-slim

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       openssh-server \
       sudo \
       supervisor \
       python3 \
       python3-apt \
       curl \
       iproute2 \
       iputils-ping \
       net-tools \
       procps \
       ca-certificates \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir -p /var/run/sshd /var/log/supervisor /home/ansible/.ssh /etc/supervisor/conf.d \
    && useradd -m -s /bin/bash ansible \
    && passwd -d ansible \
    && echo 'ansible ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/ansible \
    && chmod 440 /etc/sudoers.d/ansible

COPY images/debian-ssh/ansible_key.pub /home/ansible/.ssh/authorized_keys
COPY images/debian-ssh/sshd.conf /etc/ssh/sshd_config
COPY images/debian-ssh/supervisord.conf /etc/supervisor/supervisord.conf
COPY images/debian-ssh/entrypoint.sh /entrypoint.sh

RUN chmod 600 /home/ansible/.ssh/authorized_keys \
    && chown -R ansible:ansible /home/ansible \
    && chmod +x /entrypoint.sh

EXPOSE 22

ENTRYPOINT ["/entrypoint.sh"]
