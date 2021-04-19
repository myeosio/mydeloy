#! /bin/bash -x

source ~/eosio.deploy/scripts/env.sh

function clear_all_log() {
    find ${eosio_dir} -name "config-dir" -exec rm -rvf {} \;
    find ${eosio_dir} -name "run.log.*" -exec rm -rvf {} \;
    find ${eosio_dir} -name "run.log" -exec cp /dev/null {} \;    
    eval $success_m
}
