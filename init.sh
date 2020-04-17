#!/usr/bin/env bash

cd /var/discourse/discourse 



echo "serve_static_assets = 'true'" > config/discourse.conf
echo "db_socket = ''" >> config/discourse.conf
if [ -n "$DISCOURSE_DB_USERNAME" ]
then
  echo "db_username = '$DISCOURSE_DB_USERNAME'" >> config/discourse.conf
fi

if [ -n "$DISCOURSE_DB_PASSWORD" ]
then
  echo "db_password = '$DISCOURSE_DB_PASSWORD'" >> config/discourse.conf
fi

if [ -n "$DISCOURSE_DB_HOST" ]
then
  echo "db_host = '$DISCOURSE_DB_HOST'" >> config/discourse.conf
fi

if [ -n "$DISCOURSE_DB_PORT" ]
then
  echo "db_port = '$DISCOURSE_DB_PORT'" >> config/discourse.conf
fi

if [ -n "$DISCOURSE_DB_NAME" ]
then
  echo "db_name = '$DISCOURSE_DB_NAME'" >> config/discourse.conf
fi

if [ -n "$DISCOURSE_REDIS_HOST" ]
then
  echo "redis_host = '$DISCOURSE_REDIS_HOST'" >> config/discourse.conf
fi

if [ -n "$DISCOURSE_REDIS_PORT" ]
then
  echo "redis_port = '$DISCOURSE_REDIS_PORT'" >> config/discourse.conf
fi

if [ -n "$DISCOURSE_REDIS_PASSWORD" ]
then
  echo "redis_password = '$DISCOURSE_REDIS_PASSWORD'" >> config/discourse.conf
fi


if [ -n "$DISCOURSE_DEVELOPER_EMAILS" ]
then
  echo "developer_emails = '$DISCOURSE_DEVELOPER_EMAILS'" >> config/discourse.conf
fi

if [ -n "$DISCOURSE_SMTP_ADDRESS" ]
then
  echo "smtp_address = '$DISCOURSE_SMTP_ADDRESS'" >> config/discourse.conf
fi

if [ -n "$DISCOURSE_SMTP_PASSWORD" ]
then
  echo "smtp_password = '$DISCOURSE_SMTP_PASSWORD'" >> config/discourse.conf
fi

if [ -n "$DISCOURSE_SMTP_USER_NAME" ]
then
  echo "smtp_user_name = '$DISCOURSE_SMTP_USER_NAME'" >> config/discourse.conf
fi

if [ -n "$DISCOURSE_SMTP_PORT" ]
then
  echo "smtp_port = '$DISCOURSE_SMTP_PORT'" >> config/discourse.conf
fi

if [ -n "$DISCOURSE_SMTP_DOMAIN" ]
then
  echo "smtp_domain = '$DISCOURSE_SMTP_DOMAIN'" >> config/discourse.conf
fi

if [ -n "$DISCOURSE_SMTP_AUTHENTICATION" ]
then
  echo "smtp_authentication = '$DISCOURSE_SMTP_AUTHENTICATION'" >> config/discourse.conf
fi

if [ -n "$DISCOURSE_SMTP_ENABLE_START_TLS" ]
then
  echo "smtp_enable_start_tls = '$DISCOURSE_SMTP_ENABLE_START_TLS'" >> config/discourse.conf
fi

if [ -n "$DISCOURSE_SMTP_OPENSSL_VERIFY_MODE" ]
then
  echo "smtp_openssl_verify_mode = '$DISCOURSE_SMTP_OPENSSL_VERIFY_MODE'" >> config/discourse.conf
fi

if [ -n "$DISCOURSE_HOSTNAME" ]
then
  echo "hostname = '$DISCOURSE_HOSTNAME'" >> config/discourse.conf
fi


if [ -n "$DISCOURSE_MAXMIND_LICENSE_KEY" ]
then
  echo "maxmind_license_key = '$DISCOURSE_MAXMIND_LICENSE_KEY'" >> config/discourse.conf
fi

if [ -n "$DISCOURSE_REFRESH_MAXMIND_DB_DURING_PRECOMPILE_DAYS" ]
then
  echo "refresh_maxmind_db_during_precompile_days = '$DISCOURSE_REFRESH_MAXMIND_DB_DURING_PRECOMPILE_DAYS'" >> config/discourse.conf
fi



bundle exec rake db:migrate
#bundle exec sidekiq -d -L log/sidekiq.log -C config/sidekiq.yml -e production

nohup /var/discourse/discourse/checkSidekiq.sh &

#ps -efa | grep sidekiq |grep -v 'grep ' | awk '{print $8}'
#ps aux | grep discourse
bundle exec rails server -b 0.0.0.0

