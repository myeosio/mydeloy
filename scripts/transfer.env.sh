#! /bin/bash -x

source ~/eosio.deploy/scripts/main.env.sh

# ports
transfer_eosio_data_http_port=44300
transfer_eosio_data_ws_port=44320
transfer_agents_address=127.0.0.1
transfer_agent_filter="[{\"account\":\"eosio.stable\",\"name\":[\"transfer\"]}]"
transfer_agent_post="{\"url\":\"$agents_http\", \"filter\":{\"block_num\":1, \"filters\":$transfer_agent_filter}}"
transfer_mongod_port=44400
transfer_mongo_api_port=44500
transfer_kafka_blocker="192.168.1.188:9092"
transfer_kafka_topic="act_trace"

# dirs
transfer_dir=$eosio_dir/transfer
transfer_eosio_data_dir=$transfer_dir/$eosio_data_dn
transfer_mongod_dir=$transfer_dir/$mongod_dn
transfer_eosio_mongo_dir=$transfer_dir/$eosio_mongo_dn
transfer_mongo_api_dir=$transfer_dir/$mongo_api_dn
transfer_eosio_kafka_dir=$transfer_dir/$eosio_kafka_dn

# logs
transfer_eosio_data_log=$transfer_eosio_data_dir/$log_file
transfer_mongod_log=$transfer_mongod_dir/$log_file
transfer_eosio_mongo_log=$transfer_eosio_mongo_dir/$log_file
transfer_mongo_api_log=$transfer_mongo_api_dir/$log_file
transfer_eosio_kafka_log=$transfer_eosio_kafka_dir/$log_file

# cmds
transfer_eosio_data_cmd="eosio-data -d $transfer_eosio_data_dir/ --history-log-dir=$main_history_log_dir --abi-dir=$eosio_abi_dir/ --http-server-address=0.0.0.0:$transfer_eosio_data_http_port --ws-endpoint=0.0.0.0:$transfer_eosio_data_ws_port --filter=$transfer_agent_filter"
transfer_eosio_kafka_cmd="eosio-kafka -d $transfer_eosio_kafka_dir/ --history-log-dir=$main_history_log_dir --abi-dir=$eosio_abi_dir/ --broker-address=$transfer_kafka_blocker --topic=$transfer_kafka_topic --filter=$transfer_agent_filter"
transfer_mongod_cmd="mongod --fork --bind_ip=0.0.0.0 --port=$transfer_mongod_port --wiredTigerCacheSizeGB 30 --dbpath=$transfer_mongod_dir --logpath=$transfer_mongod_log"
transfer_mongod_auth_cmd="$transfer_mongod_cmd --auth"
transfer_eosio_mongo_cmd="eosio-mongo -d $transfer_eosio_mongo_dir/ --history-log-dir=$main_history_log_dir --abi-dir=$eosio_abi_dir/ --mongodb-uri=mongodb://writer:lcchain@127.0.0.1:$transfer_mongod_port/eos --filter=$transfer_agent_filter"
transfer_mongo_api_cmd="node server/app $transfer_mongo_api_port mongodb://127.0.0.1:$transfer_mongod_port/eos eos reader reader"
