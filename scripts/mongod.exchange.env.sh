#! /bin/bash -x

source ~/eosio.deploy/scripts/main.env.sh

mongod_exchange_port=45400
mongod_exchange_dir=$eosio_dir/$mongod_dn/exchange
mongod_exchange_log=$mongod_exchange_dir/$log_file

# cmds
mongod_exchange_cmd="mongod --fork --bind_ip=0.0.0.0 --port=$mongod_exchange_port --wiredTigerCacheSizeGB 30 --dbpath=$mongod_exchange_dir --logpath=$mongod_exchange_log"
