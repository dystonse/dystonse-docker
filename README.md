# dystonse-docker

**This repository is a part of the multi-repository project `dystonse`. See the [main repository](https://github.com/dystonse/dystonse) for more information.**

We aim to create a docker-compose configuration which can be used to deploy the whole dystonse stack. Currently included:
* a _mysql_ database, 
* a _phpmyadmin_ interface
* data collection scripts which regurlary download gtfs schedules and realtime data, and store it in .zip files
* the [dystonse-gtfs-data](https://github.com/dystonse/dystonse-gtfs-data) tool, which reads those .zip files, connects schedules and realtime data, writes the trip updates into the database, and analyses the data to generate delay statistics, from which predictions can then be generated.

### Installation Instructions

**System requirements:**
We are using this setup on a debian linux system with 8GB RAM and 500GB SSD space. But in theory, it should run on any system that fits the following requirements:

* You need to have [docker](https://docs.docker.com/get-docker/) and [docker-compose](https://docs.docker.com/compose/install/) installed.
* It currently only works on **x86 CPUs** because some docker images are not available for ARM.
* The volumes (especially the `filevolume`) need to support filenames containing `:`. Standard docker volumes and most Unix file systems (i.e. **Ext filesystem**) support this. Therefore, on Linux or MacOS hosts, volumes can also be bind-mounted from the host's filesystem. On Windows hosts, don't use bind-mounts.
* At least **4GB RAM** (we recommend 8GB).
* About **20GB free disk space** (more if you want to use more than one data source).

**After checkout:**
* Copy `sample.env`, edit and rename it, following the instructions inside the file.
* Check if the entries in `docker-compose.override.yml` match the sources you want to use. You can add new sources by copying the existing entries and changing the name and the references to `<source>.env` files of the services.
* Compile with `docker-compose build`.
* Then, execute `docker-compose up -d`.
* If you want to see the log output, execute `docker-compose logs -f`.
* (Or to combine the last three steps, use `docker-compose build && docker-compose up -d && docker-compose logs -f --tail 0`.)
