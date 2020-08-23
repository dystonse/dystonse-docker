# dystonse-docker

**This repository is a part of the multi-repository project `dystonse`. See the [main repository](https://github.com/dystonse/dystonse) for more information.**

We aim to create a docker-compose configuration which can be used to deploy the whole dystonse stack. Currently included:
* a _mysql_ database, 
* a _phpmyadmin_ interface
* data collection scripts which regurlary download gtfs schedules and realtime data, and store it in .zip files
* the [dystonse-gtfs-data](https://github.com/dystonse/dystonse-gtfs-data) tool, which reads those .zip files, connects schedules and realtime data, writes the trip updates into the database, and analyses the data to generate delay statistics, from which predictions can then be created and written into a separate table in the database, which can then be used to display a passenger information and journey planning website.
* an (optional) _nginx reverse proxy configuration_ for access to the _phpmyadmin_ and _monitor_ web services, to add ssl encryption, caching, compression, and reachability on customized (sub)domains.

### Installation Instructions

**System requirements:**
We are currently using this setup on a debian linux system with 32GB RAM, 480GB SSD space (for the database) and 4TB HDD space (for the collected realtime and schedule files, statistics and docker images). But in theory, it should run on any system that fits the following requirements:

* You need to have [docker](https://docs.docker.com/get-docker/) and [docker-compose](https://docs.docker.com/compose/install/) installed.
* It currently only works on **x86 CPUs** because some docker images are not available for ARM.
* The volumes (especially the `filevolume`) need to support filenames containing `:`. Standard docker volumes and most Unix file systems (i.e. **Ext filesystem**) support this. Therefore, on Linux or MacOS hosts, volumes can also be bind-mounted from the host's filesystem. On Windows hosts, don't use bind-mounts.
* At least **8GB RAM**.
* About **45GB free disk space**: about 20GB for storing schedules, realtime and statistics files + 20GB for the database + 5GB for docker images. 
You might need more for different/more data sources or longer time. We are using two data sources with different amounts of data, and have been collecting data for about 6 months. Our data currently take up 17GB (files) + 18GB (database) + 3.5GB (docker images).

**After checkout:**
* Copy `sample.env`, edit and rename it, following the instructions inside the file.
* If you want to use bind-mounts for `filevolume` and/or `dbvolume`, edit `docker-compose.yml` accordingly and create those directories.
* Check if the entries in `docker-compose.override.yml` match the sources you want to use. You can add new sources by copying the existing entries and changing the name and the references to `<source>.env` files of the services.

If you don't want to use the nginx reverse proxy:
  * Compile with `docker-compose build`.
  * Then, execute `docker-compose up -d`.
  * If you want to see the log output, execute `docker-compose logs -f`.
  * (Or to combine the last three steps, use `docker-compose build && docker-compose up -d && docker-compose logs -f --tail 0`.)

If you want to use the nginx reverse proxy:
  * First, edit the file `docker-compose.server.yml` to fit the (sub)domains etc. you want to use. Please read the comments in that file for details.
  * Then compile and execute with `./up.sh`.
  * If you want to see the log output, execute `./do.sh logs -f`.
