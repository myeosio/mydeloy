#! /bin/bash -x

source ~/eosio.deploy/scripts/transfer.env.sh


############################# log #########################
function clear_transfer_log() {
    echo >$transfer_eosio_data_log
    echo >$transfer_mongod_log
    echo >$transfer_eosio_mongo_log
    echo >$transfer_eosio_kafka_log
    echo >$transfer_mongo_api_log
}

############################# stop #########################
function stop_transfer_eosio_data() {
    echo -e "+ $FUNCNAME"
    stop_wait_eosio_data $transfer_eosio_data_dir
    eval $success_m
}

function stop_transfer_eosio_kafka() {
    echo -e "+ $FUNCNAME"
    stop_wait_eosio_kafka $transfer_eosio_kafka_dir
    eval $success_m
}

function stop_transfer_eosio_mongo() {
    echo -e "+ $FUNCNAME"
    stop_wait_eosio_mongo $transfer_eosio_mongo_dir
    eval $success_m
}

function stop_transfer_mongod() {
    echo -e "+ $FUNCNAME"
    stop_wait_mongod $transfer_dir
    eval $success_m
}

function stop_transfer_mongo_api() {
    echo -e "+ $FUNCNAME"
    stop_wait_port $transfer_mongo_api_port
    eval $success_m
}

############################# start #########################
function start_transfer_eosio_data() {
    stop_transfer_eosio_data
    echo >$transfer_eosio_data_log

    echo -e "+ $FUNCNAME"

    mkdir -p $transfer_eosio_data_dir

    echo $transfer_eosio_data_cmd
    nohup $transfer_eosio_data_cmd &>>$transfer_eosio_data_log & disown
    start_wait_eosio_data $transfer_eosio_data_dir

    curl -XPOST http://127.0.0.1:$transfer_eosio_data_http_port/v1/data/register_irreversible_action_trace_client -d "$transfer_agent_post" ;eval $error_d_m
    echo

    eval $success_m
}

function start_transfer_mongod() {
    stop_transfer_mongod

    echo -e "+ $FUNCNAME"

    mkdir -p $transfer_mongod_dir
    echo >$transfer_mongod_log
    
    echo $transfer_mongod_cmd
    nohup $transfer_mongod_cmd &>>$transfer_mongod_log & disown
    start_wait_mongod $transfer_mongod_dir

    sleep 3
    
    mongo --port $transfer_mongod_port admin --eval 'db.createUser({user:"root", pwd:"lcchain", roles:["root"]})'
    mongo --port $transfer_mongod_port eos --eval 'db.createUser({user:"reader", pwd:"reader", roles:["read"]})'
    mongo --port $transfer_mongod_port eos --eval 'db.createUser({user:"writer", pwd:"lcchain", roles:["readWrite"]})'

    stop_transfer_mongod
    echo $transfer_mongod_auth_cmd
    nohup $transfer_mongod_auth_cmd &>>$transfer_mongod_log & disown
    start_wait_mongod $transfer_mongod_dir

    eval $success_m
}

function start_transfer_eosio_mongo() {
    stop_transfer_eosio_mongo

    echo -e "+ $FUNCNAME"

    start_wait_mongod $transfer_mongod_dir
    
    mkdir -p $transfer_eosio_mongo_dir
    echo >$transfer_eosio_mongo_log

    echo $transfer_eosio_mongo_cmd
    nohup $transfer_eosio_mongo_cmd &>>$transfer_eosio_mongo_log & disown
    start_wait_eosio_mongo $transfer_eosio_mongo_dir

    eval $success_m
}

function start_transfer_eosio_kafka() {
    stop_transfer_eosio_kafka

    echo -e "+ $FUNCNAME"

    mkdir -p $transfer_eosio_kafka_dir
    echo >$transfer_eosio_kafka_log

    echo $transfer_eosio_kafka_cmd
    nohup $transfer_eosio_kafka_cmd &>>$transfer_eosio_kafka_log & disown
    start_wait_eosio_kafka $transfer_eosio_kafka_dir

    eval $success_m
}

function start_transfer_mongo_api() {
    echo -e "+ $FUNCNAME"

    local PWD=$(pwd)

    cd $transfer_mongo_api_dir
    git checkout $eosio_branch.transfer && git pull
    [[ $? != 0 ]] && cd $PWD && eval $error_d_m
    
    stop_transfer_mongo_api
    echo >$transfer_mongo_api_log

    echo $transfer_mongo_api_cmd
    nohup $transfer_mongo_api_cmd &>>$transfer_mongo_api_log & disown
    start_wait_port "node" "$transfer_mongo_api_port" 
    [[ $? != 0 ]] && cd $PWD && eval $error_d_m

    cd $PWD
    eval $success_m
}
