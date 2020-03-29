set -e
DATE=`date +"%Y-%m-%dT%H:%M:%S%:z"`
COLLECT_DIR=/files/$GTFS_DATA_SOURCE_ID/rt
mkdir -p $COLLECT_DIR
FILENAME_PB=$COLLECT_DIR/gtfs-rt-$DATE.pb
FILENAME_ZIP=$COLLECT_DIR/gtfs-rt-$DATE.zip

curl $GTFS_RT_URL -L -o $FILENAME_PB \
         --silent --show-error --retry-connrefused \
         --retry 20 --retry-max-time 100
zip -j $FILENAME_ZIP $FILENAME_PB
rm $FILENAME_PB
curl -s $PING_RT_URL
