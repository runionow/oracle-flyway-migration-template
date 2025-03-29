#!/bin/bash

set -e

ENV=$1
COMMAND=$2
FLYWAY_DIR="flyway"


if [[ -z $ENV || -z $COMMAND ]]; then
  echo "Usage: ./flyway.sh [dev|test|prod] [info|migrate|clean|validate]"
  exit 1
fi

CONFIG_FILE="conf/flyway-$ENV.conf"

echo "Running Flyway $COMMAND for $ENV environment"
./$FLYWAY_DIR/flyway -configFiles="$CONFIG_FILE" "$COMMAND"