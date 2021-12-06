#!/bin/bash
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc |  apt-key add -
apt update
apt install -y postgresql-13 postgresql-client-13 

/etc/init.d/postgresql status

