if [ -z "$1" ]; then echo -e "push test log entry into the checker log\nusage: ./log_test.sh error|info"; exit; fi

MSG=$(printf "[$(date "+%F %T.000")] [666] [%-5s] Test $1" $1)
echo "$MSG"
docker compose exec checker /bin/bash -c "echo $MSG >> log/server.log"

