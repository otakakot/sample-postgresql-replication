# !/bin/bash

set -eux pipefail

pg_dump -h localhost -p 54321 -U postgres --schema-only > dump.sql

psql -h localhost -p 54322 -U postgres -f dump.sql
