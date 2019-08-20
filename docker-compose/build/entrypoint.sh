#!/bin/bash

set -euo pipefail

url="$1"
shift

until wget -O- "$url"; do
  >&2 echo "Selenium is unavailable - sleeping"
  sleep 1
done

>&2 echo "Selenium is up - executing command"
exec "$@"
