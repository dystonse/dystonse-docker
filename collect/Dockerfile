FROM debian:buster-slim
MAINTAINER mail@dystonse.org

RUN apt-get update && apt-get -y install cron curl zip

# Copy crontab.txt file to the cron.d directory
COPY crontab.txt /etc/cron.d/crontab.txt
COPY *.sh /

# Give execution rights on the cron job
RUN chmod 0644 /etc/cron.d/crontab.txt
RUN chmod +x /*.sh

# Apply cron job
RUN crontab /etc/cron.d/crontab.txt

# Create the log file to be able to run tail
RUN touch /var/log/cron.log

# Set time zone. Taken from https://serverfault.com/a/683651
ENV TZ=Europe/Berlin
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Run the command on container startup
CMD mkdir -p /files/$GTFS_DATA_SOURCE_ID && printenv | grep -v "no_proxy" >> /etc/environment && cron && tail -f /var/log/cron.log
# Taken from https://stackoverflow.com/questions/37458287/how-to-run-a-cron-job-inside-a-docker-container