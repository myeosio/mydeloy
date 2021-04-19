#! /bin/bash -x

source ~/eosio.deploy/scripts/env.sh

explorer_dir=/var/www/explorer
explorer_log=$explorer_dir/$log_file
explorer_port=50000
explorer_cmd="node serve $explorer_port"
