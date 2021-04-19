#! /bin/bash -x

source ~/eosio.deploy/scripts/env.sh

# pors : 40xxx
main_http_port=8888
main_p2p_port=9000
main_history_log_ws_port=40200

# dirs
main_dir=$eosio_dir/main
main_history_log_dir=$main_dir/$history_log_dn

# logs
main_log=$main_dir/$log_file

# cmds
main_cmd="$nodeos_args -d $main_dir/ --http-server-address=0.0.0.0:$main_http_port --p2p-listen-endpoint=0.0.0.0:$main_p2p_port --plugin eosio::history_log_plugin --history-log-dir=$main_history_log_dir --ws-cache-endpoint=0.0.0.0:$main_history_log_ws_port"
main_deploy_cmd="$main_cmd -e --plugin eosio::producer_plugin -p eosio"
main_start_cmd="$main_cmd $nodeos_sync_all_peers_args"
