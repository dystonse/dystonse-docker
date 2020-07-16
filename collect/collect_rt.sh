set -e
DATE=`date +"%Y-%m-%dT%H:%M:%S%:z"`
DOWNLOAD_DIR=/files/$GTFS_DATA_SOURCE_ID/download
COLLECT_DIR=/files/$GTFS_DATA_SOURCE_ID/rt
mkdir -p $DOWNLOAD_DIR
mkdir -p $COLLECT_DIR
FILENAME_PB=$DOWNLOAD_DIR/gtfs-rt-$DATE.pb
FILENAME_ZIP=$DOWNLOAD_DIR/gtfs-rt-$DATE.zip
FILENAME_ZIP_FINAL=$COLLECT_DIR/gtfs-rt-$DATE.zip

curl $GTFS_RT_URL -L -o $FILENAME_PB \
         --silent --show-error --retry-connrefused \
         --retry 20 --retry-max-time 100
zip -j $FILENAME_ZIP $FILENAME_PB
mv $FILENAME_ZIP $FILENAME_ZIP_FINAL
rm $FILENAME_PB
if [ -n "${PING_RT_URL}" ]; then
    curl -s $PING_RT_URL
fi