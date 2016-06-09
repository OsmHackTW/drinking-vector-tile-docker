#!/bin/sh

cat <<EOF
PG_PORT_5432_TCP_ADDR=$PG_PORT_5432_TCP_ADDR
PG_PORT_5432_TCP_PORT=$PG_PORT_5432_TCP_PORT
PG_ENV_POSTGRES_DB=$PG_ENV_POSTGRES_DB
PG_ENV_POSTGRES_USER=$PG_ENV_POSTGRES_USER
PG_ENV_POSTGRES_PASSWORD=$PG_ENV_POSTGRES_PASSWORD
EOF

if [ -z $PG_ENV_POSTGRES_PASSWORD ] \
    || [ -z $PG_ENV_POSTGRES_DB ] \
    || [ -z $PG_ENV_POSTGRES_USER ] \
    || [ -z $PG_PORT_5432_TCP_ADDR ] \
    || [ -z $PG_PORT_5432_TCP_PORT ] ; then
        echo "missing Progress settings"
        exit 1
fi

sed -e "s%PG_PORT_5432_TCP_ADDR%$PG_PORT_5432_TCP_ADDR%" \
    -e "s%PG_ENV_POSTGRES_USER%$PG_ENV_POSTGRES_USER%" \
    -e "s%PG_ENV_POSTGRES_PASSWORD%$PG_ENV_POSTGRES_PASSWORD%" \
    -e "s%PG_ENV_POSTGRES_DB%$PG_ENV_POSTGRES_DB%" \
    tilestache.cfg.inc > tilestache.cfg
    
exec uwsgi --plugin python --ini ./uwsgi.ini  --static-check /usr/local/src/www
