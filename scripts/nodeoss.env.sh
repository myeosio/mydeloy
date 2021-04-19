#! /bin/bash -x

source ~/eosio.deploy/scripts/env.sh

nodeoss_size=8
# http_pors : 410xx
nodeoss_http_port_start=41000
# p2p_pors : 411xx
nodeoss_p2p_port_start=41100

# dirs
nodeoss_dir=$eosio_dir/nodeoss

