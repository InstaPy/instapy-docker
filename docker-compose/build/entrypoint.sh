#!/bin/sh

set -euo pipefail

until wget -O- "$SELENIUM"; do
  echo "Selenium is unavailable - sleeping"
  sleep 1
done

echo "Selenium is up - executing command"

exec "$@"