#! /bin/bash -x

source ~/eosio.deploy/scripts/full.env.sh

############################# stop #########################
function stop_full_eosio_jpush() {
    echo -e "+ $FUNCNAME"
    stop_wait_eosio_jpush $full_eosio_jpush_dir
    eval $success_m
}

function stop_full_eosio_kafka() {
    echo -e "+ $FUNCNAME"
    stop_wait_eosio_kafka $full_eosio_kafka_dir
    eval $success_m
}

function stop_full_eosio_data() {
    echo -e "+ $FUNCNAME"
    stop_wait_eosio_data $full_eosio_data_dir
    eval $success_m
}

function stop_full_mongo_api() {
    echo -e "+ $FUNCNAME"
    stop_wait_port $full_mongo_api_port
    eval $success_m
}

############################# start #########################
function start_full_eosio_data() {
    stop_full_eosio_data

    echo -e "+ $FUNCNAME"

    mkdir -p $full_eosio_data_dir
    echo >$full_eosio_data_log

    echo $full_eosio_data_cmd
    nohup $full_eosio_data_cmd &>>$full_eosio_data_log & disown
    start_wait_eosio_data $full_eosio_data_dir

    eval $success_m
}

function start_full_eosio_kafka() {
    stop_full_eosio_kafka

    echo -e "+ $FUNCNAME"

    mkdir -p $full_eosio_kafka_dir
    echo >$full_eosio_kafka_log

    echo $full_eosio_kafka_cmd
    nohup $full_eosio_kafka_cmd &>>$full_eosio_kafka_log & disown
    start_wait_eosio_kafka $full_eosio_kafka_dir

    eval $success_m
}

function start_full_eosio_jpush() {
    stop_full_eosio_jpush

    echo -e "+ $FUNCNAME"

    mkdir -p $full_eosio_jpush_dir
    echo >$full_eosio_jpush_log

    echo $full_eosio_jpush_cmd
    nohup $full_eosio_jpush_cmd &>>$full_eosio_jpush_log & disown
    start_wait_eosio_jpush $full_eosio_jpush_dir

    eval $success_m
}

function start_full_mongo_api() {
    echo -e "+ $FUNCNAME"

    local MYPWD=$(pwd)

    cd $full_mongo_api_dir
    git checkout $eosio_branch && git pull
    [[ $? != 0 ]] && cd $MYPWD && eval $error_d_m
    
    stop_full_mongo_api
    echo >$full_mongo_api_log
    
    echo $full_mongo_api_cmd
    nohup $full_mongo_api_cmd &>>$full_mongo_api_log & disown
    start_wait_port "node" "$full_mongo_api_port" 
    [[ $? != 0 ]] && cd $MYPWD && eval $error_d_m

    cd $MYPWD
    eval $success_m
}
