#!/bin/sh
set -eu

ssh-keygen -A >/dev/null 2>&1

exec /usr/bin/supervisord -c /etc/supervisor/supervisord.conf
