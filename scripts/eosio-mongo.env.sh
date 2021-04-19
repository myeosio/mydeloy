#! /bin/bash -x

source ~/eosio.deploy/scripts/main.env.sh
source ~/eosio.deploy/scripts/mongod.env.sh

eosio_mongo_full_log=$eosio_dir/$eosio_mongo_dn/full

# cmds
eosio_mongo_full_cmd="eosio-mongo -d $eosio_mongo_full_log/ --history-log-dir=$main_history_log_dir --abi-dir=$eosio_abi_dir/ --mongodb-uri=mongodb://writer:lcchain@127.0.0.1:$mongod_full_port/eos"
