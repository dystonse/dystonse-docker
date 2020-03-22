# dystonse-docker

**This repository is a part of the multi-repository project `dystonse`. See the [main repository](https://github.com/lenaschimmel/dystonse) for more information.**

We aim to create a docker-compose configuration which can be used to deploy the whole dystonse stack. Currently, only a _mysql_ database and a _phpmyadmin_ interface are included.

After checkout, create `secrets/mysql_dystonse_password`and `secrets/mysql_root_password` and write a password into each file. Then, execute `docker-compose up -d`.