#!/usr/bin/env bash


sed -i 's/protected-mode yes/protected-mode no/g' /etc/redis/redis.conf

/etc/init.d/redis-server start

/etc/init.d/postgresql start


PASS='test'

su postgres -c "createuser -s testuser"
su postgres -c "psql -c \"ALTER USER testuser WITH PASSWORD 'test'\""

su postgres -c 'psql -c "create database discourse"'
#su postgres -c 'psql -c "create user testuser with password ${PASS}"'
su postgres -c 'psql -c "grant all privileges on database discourse to testuser"'



cd /var/discourse/discourse

echo "db_host = '127.0.0.1'" > config/discourse.conf
echo "db_username = 'testuser'" >> config/discourse.conf
echo "db_password = 'test'" >> config/discourse.conf
echo "db_socket = ''" >> config/discourse.conf
#echo "redis_host = '35.222.193.23'" >> config/discourse.conf
#echo "redis_port = '30956'" >> config/discourse.conf



bundle exec rake db:migrate
bundle exec rake assets:precompile

rm -rf /var/discourse/discourse/config/discourse.conf

