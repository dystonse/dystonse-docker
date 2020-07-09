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

# Set time zone. Taken from https://serverfault.com/a/683651
ENV TZ=Europe/Berlin
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Run the command on container startup
CMD /command.sh
