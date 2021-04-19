#! /bin/bash -x

source ~/eosio.deploy/scripts/nodeoss.env.sh

function clear_nodeoss_log() {
    for ((i = 0; i < $nodeoss_size ; i++))
    do
        ((http_port=$nodeoss_http_port_start+$i))
        echo >$nodeoss_dir/$http_port/$log_file
    done
}

function stop_nodeoss_force() {
    echo -e "+ $FUNCNAME"
    for ((i = 0; i < $nodeoss_size ; i++))
    do
        ((http_port=$nodeoss_http_port_start+$i))
        stop_force_nodeos $nodeoss_dir/$http_port
    done
    eval $success_m
}

function stop_nodeoss() {
    echo -e "+ $FUNCNAME"
    for ((i = 0; i < $nodeoss_size ; i++))
    do
        ((http_port=$nodeoss_http_port_start+$i))
        stop_wait_nodeos $nodeoss_dir/$http_port
    done
    eval $success_m
}

function start_nodeoss() {
    stop_nodeoss

    echo -e "+ $FUNCNAME"

    for ((i = 0; i < $nodeoss_size ; i++))
    do
        ((http_port=$nodeoss_http_port_start+$i))
        ((p2p_port=$nodeoss_p2p_port_start+$i))
        local dir=$nodeoss_dir/$http_port
        local log=$dir/$log_file
        local cmd="$nodeos_args $nodeos_sync_all_peers_args -d $nodeoss_dir/$http_port --http-server-address=0.0.0.0:$http_port  --p2p-listen-endpoint=0.0.0.0:$p2p_port"

        mkdir -p $dir
        echo >$log
        
        echo $cmd
        nohup $cmd &>>$log & disown
        start_wait_nodeos $dir
    done

    eval $success_m
}
