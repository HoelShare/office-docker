#!/usr/bin/env bash

./wait-for-it.sh $DB_HOST:$DB_PORT --timeout=30

export DATABASE_URL=mysql://$DB_USER:$DB_PASS@$DB_HOST:$DB_PORT/$DB_NAME

bin/console cache:clear
bin/console doctrine:database:create
bin/console doctrine:migrations:migrate -n

/entrypoint supervisord
