# dystonse-docker

**This repository is a part of the multi-repository project `dystonse`. See the [main repository](https://github.com/lenaschimmel/dystonse) for more information.**

We aim to create a docker-compose configuration which can be used to deploy the whole dystonse stack. Currently included:
* a _mysql_ database, 
* a _phpmyadmin_ interface
* data collection scripts that store the data in .zip files

After checkout:
* create `secrets/mysql_dystonse_password`and `secrets/mysql_root_password` and write a password into each file. 
* copy `docker-compose.sample.yml`, add the healthcheck URLs and modify the data for each source to collect from. Rename the modified file to `docker-compose.override.yml`.
* then, execute `docker-compose up -d`.
