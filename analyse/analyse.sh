set -e
dystonse-gtfs-data --password $MYSQL_PASSWORD --dir /files/$GTFS_DATA_SOURCE_ID/ analyse compute-curves --all