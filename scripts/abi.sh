#! /bin/bash -x

source ~/eosio.deploy/scripts/abi.env.sh

function clear_eosio_abi_log() {
    echo >$eosio_abi_log
}

function stop_eosio_abi() {
    echo -e "+ $FUNCNAME"
    stop_wait_abi $eosio_abi_dir
    eval $success_m
}

function start_eosio_abi() {
    stop_eosio_abi

    echo -e "+ $FUNCNAME"

    mkdir -p $eosio_abi_dir
    clear_eosio_abi_log  

    echo $eosio_abi_cmd
    nohup $eosio_abi_cmd &>>$eosio_abi_log & disown
    start_wait_eosio_abi $eosio_abi_dir

    eval $success_m
}