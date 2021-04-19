#! /bin/bash -x

source ~/eosio.deploy/scripts/agents.env.sh

function clear_agents_log() {
    for ((i = 0; i < $agents_size ; i++))
    do
        ((http_port=$agents_http_port_start+$i))
        echo >$agents_dir/$http_port.log
    done
}

function stop_agents() {
    echo -e "+ $FUNCNAME"
    for ((i = 0; i < $agents_size ; i++))
    do
        ((http_port=$agents_http_port_start+$i))
        stop_wait_eosio_agent $http_port
    done
    eval $success_m
}

function start_agents() {
    stop_agents

    echo -e "+ $FUNCNAME"

    mkdir -p $agents_dir
    clear_agents_log

    for ((i = 0; i < $agents_size ; i++))
    do
        ((http_port=$agents_http_port_start+$i))
        local cmd="$agent_cmd --http-server-address=0.0.0.0:$http_port"

        echo $cmd
        nohup $cmd &>>$agents_dir/$http_port.log & disown
        start_wait_eosio_agent $http_port
    done

    eval $success_m
}
