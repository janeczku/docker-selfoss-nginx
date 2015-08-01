#!/bin/sh

#
# This script will be placed in /config/init/ and run when container starts.
# It creates (if they're not exist yet) necessary directories
# from where custom Nginx configs can be loaded (from mounted /data volumes).
#

set -e

if [ ! -f "/data/logs/selfoss_update.log" ]
then
        touch /data/logs/selfoss_update.log
        chown www:www /data/logs/selfoss_update.log
        chmod 644 /data/logs/selfoss_update.log
fi
