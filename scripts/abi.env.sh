#! /bin/bash -x

source ~/eosio.deploy/scripts/main.env.sh

eosio_abi_dir=$eosio_dir/$eosio_abi_dn
eosio_abi_log=$eosio_abi_dir/$log_file

# cmds
eosio_abi_cmd="eosio-abi -d $eosio_abi_dir/ --history-log-dir=$main_history_log_dir"

