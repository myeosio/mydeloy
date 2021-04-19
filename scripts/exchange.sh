#! /bin/bash -x

source ~/eosio.deploy/scripts/exchange.env.sh

############################# log #########################
function clear_exchange_log() {
    echo >$exchange_eosio_data_log
    echo >$exchange_eosio_mongo_log
    echo >$exchange_eosio_kafka_log
}

############################# stop #########################
function stop_exchange_eosio_data() {
    echo -e "+ $FUNCNAME"
    stop_wait_eosio_data $exchange_eosio_data_dir
    eval $success_m
}

function stop_exchange_eosio_kafka() {
    echo -e "+ $FUNCNAME"
    stop_wait_eosio_kafka $exchange_eosio_kafka_dir
    eval $success_m
}

function stop_exchange_eosio_mongo() {
    echo -e "+ $FUNCNAME"
    stop_wait_eosio_mongo $exchange_eosio_mongo_dir
    eval $success_m
}


############################# start #########################
function start_exchange_eosio_data() {
    stop_exchange_eosio_data
    echo >$exchange_eosio_data_log

    echo -e "+ $FUNCNAME"

    mkdir -p $exchange_eosio_data_dir

    echo $exchange_eosio_data_cmd
    nohup $exchange_eosio_data_cmd &>>$exchange_eosio_data_log & disown
    start_wait_eosio_data $exchange_eosio_data_dir

    curl -XPOST http://127.0.0.1:$exchange_eosio_data_http_port/v1/data/register_irreversible_action_trace_client -d "$exchange_agent_post" ;eval $error_d_m
    echo

    eval $success_m
}

function start_exchange_eosio_mongo() {
    stop_exchange_eosio_mongo

    echo -e "+ $FUNCNAME"

    start_wait_mongod $mongod_exchange
    
    mkdir -p $exchange_eosio_mongo_dir
    echo >$exchange_eosio_mongo_log

    echo $exchange_eosio_mongo_cmd
    nohup $exchange_eosio_mongo_cmd &>>$exchange_eosio_mongo_log & disown
    start_wait_eosio_mongo $exchange_eosio_mongo_dir

    eval $success_m
}

function start_exchange_eosio_kafka() {
    stop_exchange_eosio_kafka

    echo -e "+ $FUNCNAME"

    mkdir -p $exchange_eosio_kafka_dir
    echo >$exchange_eosio_kafka_log

    echo $exchange_eosio_kafka_cmd
    nohup $exchange_eosio_kafka_cmd &>>$exchange_eosio_kafka_log & disown
    start_wait_eosio_kafka $exchange_eosio_kafka_dir

    eval $success_m
}

############################# mongo service #########################
function stop_exchange_mongo_api() {
    echo -e "+ $FUNCNAME"
    stop_wait_port $exchange_mongo_api_port
    eval $success_m
}

function start_exchange_mongo_api() {
    echo -e "+ $FUNCNAME"

    local PWD=$(pwd)

    cd $exchange_mongo_api_dir
    git checkout coin.exchange && git pull
    [[ $? != 0 ]] && cd $PWD && eval $error_d_m

    stop_exchange_mongo_api
    echo >$exchange_mongo_api_log

    echo $exchange_mongo_api_cmd
    nohup $exchange_mongo_api_cmd &>>$exchange_mongo_api_log & disown
    start_wait_port "node" "$exchange_mongo_api_port" 
    [[ $? != 0 ]] && cd $PWD && eval $error_d_m

    cd $PWD
    eval $success_m
}
