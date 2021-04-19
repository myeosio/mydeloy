#! /bin/bash -x

source ~/eosio.deploy/scripts/main.env.sh

mongod_full_port=27017
mongod_full_dir=$eosio_dir/$mongod_dn/full
mongod_full_log=$mongod_full_dir/$log_file

# cmds
mongod_full_cmd="mongod --fork --bind_ip=0.0.0.0 --port=$mongod_full_port --wiredTigerCacheSizeGB 30 --dbpath=$mongod_full_dir --logpath=$mongod_full_log"
