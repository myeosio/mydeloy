#! /bin/bash -x

source ~/eosio.deploy/scripts/mongod.full.env.sh

function stop_mongod_full() {
    echo -e "+ $FUNCNAME"
    stop_wait_mongod $mongod_full_dir
    eval $success_m
}

function deploy_mongod_full() {
    stop_mongod_full

    echo -e "+ $FUNCNAME"

    mkdir -p $mongod_full_dir    
    echo >$mongod_full_log

    echo $mongod_full_cmd
    nohup $mongod_full_cmd &>>$mongod_full_log & disown
    start_wait_mongod $mongod_full_dir

    sleep 3
    
    mongo --port $mongod_full_port  admin --eval 'db.createUser({user:"root", pwd:"lcchain", roles:["root"]})'
    mongo --port $mongod_full_port  eos --eval 'db.createUser({user:"reader", pwd:"reader", roles:["read"]})'
    mongo --port $mongod_full_port  eos --eval 'db.createUser({user:"writer", pwd:"lcchain", roles:["readWrite"]})'

    stop_mongod_full

    eval $success_m
}