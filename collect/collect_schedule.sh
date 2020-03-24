set -e
DIR=/files
DATE=`date +"%Y-%m-%d"`
mkdir -p $DIR/$GTFS_ID/schedule
FILENAME_ZIP=$DIR/$GTFS_ID/schedule/gtfs-schedule-$DATE.zip

curl -s $PING_SCHEDULE_URL/start
curl $GTFS_SCHEDULE_URL -o $FILENAME_ZIP \
         --silent --show-error --retry-connrefused \
         --retry 20 --retry-max-time 100
curl -s $PING_SCHEDULE_URL
