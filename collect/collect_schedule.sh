set -e
DOWNLOAD_DIR=/files/$GTFS_DATA_SOURCE_ID/download
COLLECT_DIR=/files/$GTFS_DATA_SOURCE_ID/schedule
DATE=`date +"%Y-%m-%d"`
mkdir -p $DOWNLOAD_DIR
mkdir -p $COLLECT_DIR
FILENAME_ZIP=$DOWNLOAD_DIR/gtfs-schedule-$DATE.zip
FILENAME_ZIP_FINAL=$COLLECT_DIR/gtfs-schedule-$DATE.zip

curl -s $PING_SCHEDULE_URL/start
curl $GTFS_SCHEDULE_URL -L -o $FILENAME_ZIP \
         --silent --show-error --retry-connrefused \
         --retry 20 --retry-max-time 100
mv $FILENAME_ZIP $FILENAME_ZIP_FINAL
curl -s $PING_SCHEDULE_URL
