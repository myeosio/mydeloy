#! /bin/bash -x

source ~/eosio.deploy/scripts/eosio-mongo.env.sh

function stop_full_eosio_mongo() {
    echo -e "+ $FUNCNAME"
    stop_wait_eosio_mongo $eosio_mongo_full_log
    eval $success_m
}

function start_full_eosio_mongo() {
    stop_full_eosio_mongo

    echo -e "+ $FUNCNAME"

    start_wait_mongod $mongod_full_dir
    
    mkdir -p $eosio_mongo_full_log
    echo >$eosio_mongo_full_log

    echo $eosio_mongo_full_cmd
    nohup $eosio_mongo_full_cmd &>>$eosio_mongo_full_log & disown
    start_wait_eosio_mongo $eosio_mongo_full_log

    eval $success_m
}
