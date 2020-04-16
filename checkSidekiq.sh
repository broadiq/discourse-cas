#!/bin/bash
SERVICE='sidekiq'

i=0
while [ $i -le 18 ]
do
  sleep 10
  echo Number: $i
  ((i++))

  echo "$(date)"

  if ps ax | grep -v grep | grep $SERVICE > /dev/null
  then
        echo "$SERVICE service running, everything is fine"
	#i=20
  else
        echo "$SERVICE is not running"
	bundle exec sidekiq -d -L log/sidekiq.log -C config/sidekiq.yml -e production
  fi

done

echo "Existing..."
 
