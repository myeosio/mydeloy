#! /bin/bash -x

source ~/eosio.deploy/scripts/main.env.sh

#ports
full_eosio_data_http_port=43300
full_eosio_data_ws_port=43320
full_mongo_api_port=43500
full_kafka_blocker="localhost:9092"
full_kafka_topic="act_trace.full"

# dirs
full_dir=$eosio_dir/full
full_eosio_data_dir=$full_dir/$eosio_data_dn
full_mongo_api_dir=$full_dir/$mongo_api_dn
full_eosio_kafka_dir=$full_dir/$eosio_kafka_dn
full_eosio_jpush_dir=$full_dir/$eosio_jpush_dn

# logs
full_eosio_data_log=$full_eosio_data_dir/$log_file
full_mongo_api_log=$full_mongo_api_dir/$log_file
full_eosio_kafka_log=$full_eosio_kafka_dir/$log_file
full_eosio_jpush_log=$full_eosio_jpush_dir/$log_file

# cmds
full_eosio_data_cmd="eosio-data -d $full_eosio_data_dir/ --history-log-dir=$main_history_log_dir/ --abi-dir=$eosio_abi_dir/ --http-server-address=0.0.0.0:$full_eosio_data_http_port --ws-endpoint=0.0.0.0:$full_eosio_data_ws_port"
full_eosio_kafka_cmd="eosio-kafka -d $full_eosio_kafka_dir/ --history-log-dir=$main_history_log_dir --abi-dir=$eosio_abi_dir/ --broker-address=$full_kafka_blocker --topic=$full_kafka_topic"
full_eosio_jpush_cmd="eosio-jpush -d $full_eosio_jpush_dir/ --history-log-dir=$main_history_log_dir --abi-dir=$eosio_abi_dir/"
full_mongo_api_cmd="node server/app $full_mongo_api_port mongodb://127.0.0.1:$mongod_full_port/eos eos reader reader"
