#!/bin/bash
STACK_ID=$STACK_ID
INSTANCE_ID=$INSTANCE_ID

sed -i \
  -e "s/MO_STACK_ID/$STACK_ID/g" \
  -e "s/MO_INSTANCE_ID/$INSTANCE_ID/g" \
  /etc/awslogs/awslogs.conf

exec /usr/local/bin/supervisord -c /etc/supervisord.conf
