#! /bin/bash -x

source ~/eosio.deploy/scripts/main.env.sh

# ports
exchange_eosio_data_http_port=45300
exchange_eosio_data_ws_port=45320
exchange_agents_address=127.0.0.1
exchange_agent_filter="[{\"account\":\"newexchange\",\"name\":[\"addcoin\",\"addtradepair\",\"adddeal\",\"addhstrorder\"]}]"
exchange_agent_post="{\"url\":\"$agents_http\", \"filter\":{\"block_num\":1, \"filters\":$exchange_agent_filter}}"
exchange_mongo_api_port=45500
exchange_kafka_blocker="localhost:9092"
exchange_kafka_topic="deals"
exchange_kafka_filter="[{\"account\":\"newexchange\",\"name\":[\"adddeal\"]}]"

# dirs
exchange_data_dir=$eosio_dir/exchange
exchange_eosio_data_dir=$exchange_data_dir/$eosio_data_dn
exchange_eosio_mongo_dir=$exchange_data_dir/$eosio_mongo_dn
exchange_mongo_api_dir=$exchange_data_dir/$mongo_api_dn
exchange_eosio_kafka_dir=$exchange_data_dir/$eosio_kafka_dn

# logs
exchange_eosio_data_log=$exchange_eosio_data_dir/$log_file
exchange_eosio_mongo_log=$exchange_eosio_mongo_dir/$log_file
exchange_mongo_api_log=$exchange_mongo_api_dir/$log_file
exchange_eosio_kafka_log=$exchange_eosio_kafka_dir/$log_file

# cmds
exchange_eosio_data_cmd="eosio-data -d $exchange_eosio_data_dir/ --history-log-dir=$main_history_log_dir --abi-dir=$eosio_abi_dir/ --http-server-address=0.0.0.0:$exchange_eosio_data_http_port --ws-endpoint=0.0.0.0:$exchange_eosio_data_ws_port --filter=$exchange_agent_filter"
exchange_eosio_kafka_cmd="eosio-kafka -d $exchange_eosio_kafka_dir/ --history-log-dir=$main_history_log_dir --abi-dir=$eosio_abi_dir/ --broker-address=$exchange_kafka_blocker --topic=$exchange_kafka_topic --filter=$exchange_kafka_filter"
exchange_eosio_mongo_cmd="eosio-mongo  -d $exchange_eosio_mongo_dir/ --history-log-dir=$main_history_log_dir --abi-dir=$eosio_abi_dir/ --mongodb-uri=mongodb://writer:lcchain@127.0.0.1:$mongod_exchange_port/eos --filter=$exchange_agent_filter"
exchange_mongo_api_cmd="node server/app $exchange_mongo_api_port mongodb://127.0.0.1:$mongod_exchange_port/eos eos reader reader"
