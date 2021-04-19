#! /bin/bash -x

producer_address=172.16.0.181
#producer_address=39.106.5.40

producer1_p2p_port=9001
producer2_p2p_port=9002
producer3_p2p_port=9003

genesis_path=~/eosio.deploy/genesis.json

eosio_branch=coin
eosio_dir=/data/eosio.$eosio_branch

#nginx
producers_http=http://$producer_address/producers.http/
agents_address=127.0.0.1
agents_http=http://$agents_address/eosio_agents/v1/agent/push_action_traces_to_service/

#dn = dir-name
nodeos_dn=nodeos
history_log_dn=history-log
nodeoss_dn=nodeoss
eosio_abi_dn=eosio-abi
agents_dn=agents
eosio_data_dn=eosio-data
eosio_mongo_dn=eosio-mongo
mongod_dn=mongod
mongo_api_dn=mongo-api
eosio_kafka_dn=eosio-kafka
eosio_jpush_dn=eosio-jpush

log_file=run.log

nodeos_args="nodeos --plugin eosio::chain_api_plugin --plugin eosio::http_plugin --plugin eosio::net_api_plugin --plugin eosio::producer_api_plugin --max-clients=0 --chain-state-db-size-mb=2048 --access-control-allow-origin=* --contracts-console --http-validate-host=false --verbose-http-errors --max-transaction-time 900000000 --p2p-max-nodes-per-host=10000 --genesis-json $genesis_path"
nodeos_sync_main_peer_args="--p2p-peer-address=127.0.0.1:$main_p2p_port"
nodeos_sync_peer1_args="--p2p-peer-address=$producer_address:$producer1_p2p_port"
nodeos_sync_peer2_args="--p2p-peer-address=$producer_address:$producer2_p2p_port"
nodeos_sync_peer3_args="--p2p-peer-address=$producer_address:$producer3_p2p_port"
nodeos_sync_all_peers_args="$nodeos_sync_peer1_args $nodeos_sync_peer2_args $nodeos_sync_peer3_args"

#######################################################################################
error_m='echo "! $FUNCNAME failure ." && echo && return -1'
error_d_m='[[ $? != 0 ]] && echo "! $FUNCNAME failure ." && echo && return -1'
error_d='[[ $? != 0 ]] && return -1'

success_m='echo "- $FUNCNAME success ." && echo && return 0'
success_d_m='[[ $? == 0 ]] && echo "- $FUNCNAME success ." && echo && return 0'
success_d='[[ $? == 0 ]] && return 0'

##########################################################################

function unlock_wallet() {
    echo -e "+ $FUNCNAME"
    pkill -9 keosd
    rm -rf ~/eosio-wallet
    tar zxvf ~/eosio.deploy/eosio-wallet.tar.gz -C ~/
    nohup keosd &>>/tmp/keosd & disown
    while [[ true ]]; do
        cleos wallet unlock --password < ~/eosio.deploy/passwd.txt ; eval $success_d_m
        sleep 1
    done
    
    eval $error_m
}

##########################################################################

function pf() {
    ps -ef | grep -v grep | grep -w "$4" | grep -w "$3" | grep -w "$2" | grep -w "$1" 
}

function ps_find() {
    ps aux | grep -w "$1" | grep -w "$2" | grep -v grep | awk '{print $2}'
}

function stop_force() {
    pid=$(ps_find "$1" "$2")
    [[ $pid != "" ]] && kill -9 $pid
}

function stop_wait() {
    while [[ true ]]; do
        echo "waiting for <$1> stopping ..."
        pid=$(ps_find "$1" "$2")
        [[ $pid == "" ]] && echo "<$1> quit ..." && eval $success_d
        kill $pid
        sleep 1
    done
}

function stop_wait_port() {
    pname=$(lsof -i :$1 | tail -1 | awk '{print $1}')
    while [[ true ]]; do
        echo "waiting for <$pname> stopping ..."        
        pid=$(lsof -i :$1 | tail -1 | awk '{print $2}')
        [[ $pid == "" ]] && echo "<$pname> quit ..." && echo && eval $success_d
        kill $pid
        sleep 1
    done
}

function start_wait() {
    while [[ true ]]; do
        sleep 1
        echo "waiting for <$1> starting ..."
        ps aux | grep -w "$1" | grep -w "$2" | grep -v grep > /dev/null
        [[ $? == 0 ]] && echo "<$1> started ..." && echo && eval $success_d
    done
}

function start_wait_port() {
    while [[ true ]]; do
        sleep 1
        echo "waiting for <$1> starting ..."          
        lsof -i :$2 | tail -1
        [[ $? != "" ]] && echo "<$1> started ..." && echo && eval $success_d
    done
}

##########################################################################

function stop_force_nodeos() {
    echo -e "+ $FUNCNAME ---> $1"
    stop_force "nodeos" "$1"
}

function stop_force_eosio_abi() {
    echo -e "+ $FUNCNAME ---> $1"
    stop_force "eosio-abi" "$1"
}

function stop_force_eosio_agent() {
    echo -e "+ $FUNCNAME ---> $1"
    stop_force "eosio-agent" "$1"
}

function stop_force_eosio_data() {
    echo -e "+ $FUNCNAME ---> $1"
    stop_force "eosio-data" "$1"
}

function stop_force_eosio_mongo() {
    echo -e "+ $FUNCNAME ---> $1"
    stop_force "eosio-mongo" "$1"
}

function stop_force_eosio_kafka() {
    echo -e "+ $FUNCNAME ---> $1"
    stop_force "eosio-kafka" "$1"
}

function stop_force_eosio_jpush() {
    echo -e "+ $FUNCNAME ---> $1"
    stop_force "eosio-jpush" "$1"
}

function stop_force_mongod() {
    echo -e "+ $FUNCNAME ---> $1"
    stop_force "mongod" "$1"
}

##########################################################################

function stop_wait_nodeos() {
    echo -e "+ $FUNCNAME ---> $1"
    stop_wait "nodeos" "$1"
}

function stop_wait_abi() {
    echo -e "+ $FUNCNAME ---> $1"
    stop_wait "eosio-abi -d" "$1"
}

function stop_wait_eosio_agent() {
    echo -e "+ $FUNCNAME ---> $1"
    stop_wait_port "$1"
}

function stop_wait_eosio_data() {
    echo -e "+ $FUNCNAME ---> $1"
    stop_wait "eosio-data" "$1"
}

function stop_wait_eosio_mongo() {
    echo -e "+ $FUNCNAME ---> $1"
    stop_wait "eosio-mongo" "$1"
}

function stop_wait_eosio_kafka() {
    echo -e "+ $FUNCNAME ---> $1"
    stop_wait "eosio-kafka" "$1"
}

function stop_wait_eosio_jpush() {
    echo -e "+ $FUNCNAME ---> $1"
    stop_wait "eosio-jpush" "$1"
}

function stop_wait_mongod() {
    echo -e "+ $FUNCNAME ---> $1"
    stop_wait "mongod" "$1"
}

##########################################################################

function start_wait_nodeos() {
    echo -e "+ $FUNCNAME ---> $1"
    start_wait "nodeos" $1
}

function start_wait_eosio_abi() {
    echo -e "+ $FUNCNAME ---> $1"
    start_wait "eosio-abi" "$1"
}

function start_wait_eosio_agent() {
    echo -e "+ $FUNCNAME ---> $1"
    start_wait_port "eosio-agent" "$1"
}

function start_wait_eosio_data() {
    echo -e "+ $FUNCNAME ---> $1"
    start_wait "eosio-data" "$1"
}

function start_wait_eosio_mongo() {
    echo -e "+ $FUNCNAME ---> $1"
    start_wait "eosio-mongo" "$1"
}

function start_wait_eosio_kafka() {
    echo -e "+ $FUNCNAME ---> $1"
    start_wait "eosio-kafka" "$1"
}

function start_wait_eosio_jpush() {
    echo -e "+ $FUNCNAME ---> $1"
    start_wait "eosio-jpush" "$1"
}

function start_wait_mongod() {
    echo -e "+ $FUNCNAME ---> $1"
    start_wait "mongod" "$1"
}
