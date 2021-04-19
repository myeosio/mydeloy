#! /bin/bash -x

source ~/eosio.deploy/scripts/main.env.sh

function clear_main_log() {
    echo >$main_log
}

function stop_main_force() {
    echo -e "+ $FUNCNAME"
    stop_force_nodeos $main_dir
    eval $success_m
}

function stop_main() {
    echo -e "+ $FUNCNAME"
    stop_wait_nodeos $main_dir    
    eval $success_m
}

function deploy_main() {
    stop_main_force

    echo -e "+ $FUNCNAME"

    mkdir -p $main_dir && rm -rf $main_dir/*

    echo $main_deploy_cmd
    nohup $main_deploy_cmd &>>$main_log & disown
    start_wait_nodeos $main_dir
 
    eval $success_m
}

function start_main() {
    stop_main

    echo -e "+ $FUNCNAME"

    mkdir -p $main_dir
    clear_main_log
 
    echo $main_start_cmd
    nohup $main_start_cmd &>>$main_log & disown
    start_wait_nodeos $main_dir

    eval $success_m
}
