#! /bin/bash -x

source ~/eosio.deploy/scripts/main.sh
source ~/eosio.deploy/scripts/system.contracts.sh
source ~/eosio.deploy/scripts/producers.sh
source ~/eosio.deploy/scripts/nodeoss.sh
source ~/eosio.deploy/scripts/abi.sh
source ~/eosio.deploy/scripts/agents.sh
source ~/eosio.deploy/scripts/web.server.sh
source ~/eosio.deploy/scripts/full.sh
source ~/eosio.deploy/scripts/mongod.full.sh
source ~/eosio.deploy/scripts/transfer.sh
source ~/eosio.deploy/scripts/exchange.sh
source ~/eosio.deploy/scripts/clear_log.sh

function deploy() {
    echo -e "+ $FUNCNAME"

    deploy_main             ;eval $error_d_m
    deploy_system_contracts ;eval $error_d_m
    deploy_producers        ;eval $error_d_m
    start_main              ;eval $error_d_m
    start_nodeoss           ;eval $error_d_m
    start_agents            ;eval $error_d_m
    start_full              ;eval $error_d_m
    start_transfer          ;eval $error_d_m

    eval $success_m
}
