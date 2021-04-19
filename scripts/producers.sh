#! /bin/bash -x

source ~/eosio.deploy/scripts/main.env.sh
source ~/eosio.deploy/scripts/producers.env.sh

function create_producers() {
    echo -e "+ $FUNCNAME"

    if [[ $1 == "" ]]
    then
        start=1
    else
        start=$1
    fi

    if [[ $2 == "" ]]
    then
        end=$producers_size
    else
        end=$2
    fi

    for ((i = $start; i <= $end ; i++))
    do
        local name=$(eval echo \${producer${i}_name})
        local pubkey=$(eval echo \${producer${i}_pubkey})
        cleos create account eosio $name $pubkey                                ;eval $error_d_m
    done

    for ((i = $start; i <= $end ; i++))
    do
        local name=$(eval echo \${producer${i}_name})
        local pubkey=$(eval echo \${producer${i}_pubkey})
        cleos system regproducer $name $pubkey https://$name.com/$pubkey        ;eval $error_d_m
    done

    for ((i = $start; i <= $end ; i++))
    do
        ((tickets=200000000000-($i-1)*100))
        local name=$(eval echo \${producer${i}_name})
        cleos system voteproducer prod eosio.mngr $name $tickets                ;eval $error_d_m
    done

    cleos push action eosio setprodlimit '[6]' -p eosio         ;eval $error_d_m

    eval $success_m
}

function update_producers_permission() {
    echo -e "+ $FUNCNAME"

    if [[ $1 == "" ]]
    then
        start=1
    else
        start=$1
    fi

    if [[ $2 == "" ]]
    then
        end=$producers_size
    else
        end=$2
    fi

    for ((i = $start; i <= $end ; i++))
    do
        local name=$(eval echo \${producer${i}_name})
        local pubkey=$(eval echo \${producer${i}_pubkey})
        local prvkey=$(eval echo \${producer${i}_prvkey})
        echo $name
        echo $pubkey
        echo $prvkey
        echo
        cleos set account permission $name active '{"threshold": 1,"keys": [{"key": "'$pubkey'","weight": 1}],"accounts": []}' owner -p $name   ;eval $error_d_m
        cleos set account permission $name owner '{"threshold": 1,"keys": [{"key": "'$pubkey'","weight": 1}],"accounts": []}' -p $name@owner    ;eval $error_d_m
        cleos system regproducer $name $pubkey https://$name.com/$pubkey        ;eval $error_d_m
    done
}

function update_producers_info() {
    echo -e "+ $FUNCNAME"

    if [[ $1 == "" ]]
    then
        start=1
    else
        start=$1
    fi

    if [[ $2 == "" ]]
    then
        end=$producers_size
    else
        end=$2
    fi

    if [[ $3 == "" ]]
    then
        loc=156
    else
        loc=$3
    fi

    for ((i = $start; i <= $end ; i++))
    do
        local name=$(eval echo \${producer${i}_name})
        local pubkey=$(eval echo \${producer${i}_pubkey})
        echo $name
        echo $pubkey
        echo $loc
        echo
        cleos system regproducer $name $pubkey https://$name.com/$pubkey $loc       ;eval $error_d_m
    done    
}

function stop_producers_force() {
    echo -e "+ $FUNCNAME"

    if [[ $1 == "" ]]
    then
        start=1
    else
        start=$1
    fi

    if [[ $2 == "" ]]
    then
        end=$producers_size
    else
        end=$2
    fi

    for ((i = $start; i <= $end ; i++))
    do
        local dir=$(eval echo \${producer${i}_dir})
        stop_force_nodeos $dir
        mkdir -p $dir && rm -rf $dir/*
    done
    eval $success_m
}

function stop_producers() {
    echo -e "+ $FUNCNAME"

    if [[ $1 == "" ]]
    then
        start=1
    else
        start=$1
    fi

    if [[ $2 == "" ]]
    then
        end=$producers_size
    else
        end=$2
    fi

    for ((i = $start; i <= $end ; i++))
    do
        local dir=$(eval echo \${producer${i}_dir})
        stop_wait_nodeos $dir
    done
    eval $success_m
}

function deploy_producers() {
    echo -e "+ $FUNCNAME"

    if [[ $1 == "" ]]
    then
        start=1
    else
        start=$1
    fi

    if [[ $2 == "" ]]
    then
        end=$producers_size
    else
        end=$2
    fi

    stop_producers_force $start $end

    for ((i = $start; i <= $end ; i++))
    do
        local dir=$(eval echo \${producer${i}_dir})
        mkdir -p $dir && rm -rf $dir/*
    done    

    unlock_wallet ;eval $error_d_m

    create_producers $start $end ;eval $error_d_m

    for ((i = $start; i <= $end ; i++))
    do
        local cmd=$(eval echo \${producer${i}_cmd})
        local log=$(eval echo \${producer${i}_log})
        local dir=$(eval echo \${producer${i}_dir})
        nohup $cmd &>>$log & disown
        start_wait_nodeos $dir
    done

    eval $success_m
}

function start_producers() {
    echo -e "+ $FUNCNAME"

    if [[ $1 == "" ]]
    then
        start=1
    else
        start=$1
    fi

    if [[ $2 == "" ]]
    then
        end=$producers_size
    else
        end=$2
    fi

    unlock_wallet ;eval $error_d_m

    for ((i = $start; i <= $end ; i++))
    do
        local cmd=$(eval echo \${producer${i}_cmd})
        local log=$(eval echo \${producer${i}_log})
        local dir=$(eval echo \${producer${i}_dir})

        mkdir -p $dir
        echo >$log
        stop_wait_nodeos $dir
        nohup $cmd &>>$log & disown
        start_wait_nodeos $dir
    done

    eval $success_m
}

function clear_producers_log() {
    if [[ $1 == "" ]]
    then
        start=1
    else
        start=$1
    fi

    if [[ $2 == "" ]]
    then
        end=$producers_size
    else
        end=$2
    fi

    for ((i = $start; i <= $end ; i++))
    do
        local log=$(eval echo \${producer${i}_log})
        echo >$log
    done
}
