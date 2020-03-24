set -e
DIR=/files
DATE=`date +"%Y-%m-%dT%H:%M:%S%:z"`
mkdir -p $DIR/$GTFS_ID/rt
FILENAME_PB=$DIR/$GTFS_ID/rt/gtfs-rt-$DATE.pb
FILENAME_ZIP=$DIR/$GTFS_ID/rt/gtfs-rt-$DATE.zip

curl $GTFS_RT_URL -o $FILENAME_PB \
         --silent --show-error --retry-connrefused \
         --retry 20 --retry-max-time 100
zip $FILENAME_ZIP $FILENAME_PB
rm $FILENAME_PB
curl -s $PING_RT_URL
