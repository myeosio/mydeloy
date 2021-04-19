#! /bin/bash -x

source ~/eosio.deploy/scripts/mongod.exchange.env.sh

function stop_mongod_exchange() {
    echo -e "+ $FUNCNAME"
    stop_wait_mongod $mongod_exchange_dir
    eval $success_m
}

function start_mongod_exchange() {
    stop_mongod_exchange

    echo -e "+ $FUNCNAME"

    mkdir -p $mongod_exchange_dir    
    echo >$mongod_exchange_log
    
    echo $mongod_exchange_cmd
    nohup $mongod_exchange_cmd &>>$mongod_exchange_log & disown
    start_wait_mongod $mongod_exchange_dir

    sleep 3
    
    mongo --port $mongod_exchange_port admin --eval 'db.createUser({user:"root", pwd:"lcchain", roles:["root"]})'
    mongo --port $mongod_exchange_port eos --eval 'db.createUser({user:"reader", pwd:"reader", roles:["read"]})'
    mongo --port $mongod_exchange_port eos --eval 'db.createUser({user:"writer", pwd:"lcchain", roles:["readWrite"]})'

    stop_wait_mongod_exchange

    eval $success_m
}
