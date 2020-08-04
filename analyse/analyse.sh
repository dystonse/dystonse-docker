set -e
if [ -n "${PING_ANALYSE_URL}" ]; then
    curl -s $PING_ANALYSE_URL/start
fi
/usr/local/bin/dystonse-gtfs-data --password $MYSQL_PASSWORD --dir /files/$GTFS_DATA_SOURCE_ID/ analyse compute-curves --all
if [ -n "${PING_ANALYSE_URL}" ]; then
    curl -s $PING_ANALYSE_URL
fi