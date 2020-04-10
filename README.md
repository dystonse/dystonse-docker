# dystonse-docker

**This repository is a part of the multi-repository project `dystonse`. See the [main repository](https://github.com/lenaschimmel/dystonse) for more information.**

We aim to create a docker-compose configuration which can be used to deploy the whole dystonse stack. Currently included:
* a _mysql_ database, 
* a _phpmyadmin_ interface
* data collection scripts which regurlary download gtfs schedules and realtime data, and store it in .zip files
* the [dystonse-gtfs-importer](https://github.com/dystonse/dystonse-gtfs-importer) which reads those .zip files, connects schedules and realtime data, and writes the trip updates into the database

After checkout:
* create `secrets/mysql_dystonse_password`and `secrets/mysql_root_password` and write a password into each file. 
* copy `docker-compose.sample.yml`, add the healthcheck URLs and modify the data for each source to collect and import. Rename the modified file to `docker-compose.override.yml`.
* then, execute `docker-compose up -d`.
