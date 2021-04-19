#! /bin/bash -x

source ~/eosio.deploy/scripts/main.env.sh

function test_main_eosio_data() {
    start=$1
    count=$2
    ((end=start+count))

    for ((i = ${start}; i < ${end}; i++))
    do
        echo "i = ${i}"
        result=`curl http://127.0.0.1:${main_eosio_data_http_port}/v1/data/get_irreversible_block -XPOST -d "${i}" 2>/dev/null`
        if [[ ${result} = '{"blocks":[],"sign":"","state":""}'  ]] ; then
            echo -------------------------------------------------
            echo ${result}
            echo -------------------------------------------------        
            echo
            break
        fi
    done
}


function test_deploy_system_contract() {
    unlock_wallet

    for ((i = 1; i <= 5 ; i++))
    do
        for ((j = 1; j <= 5 ; j++))
        do
            for ((k = 1; k <= 5 ; k++))
            do
                for ((l = 1; l <= 5 ; l++))
                do
                    echo
                    name=${1}${i}${j}${k}${l}
                    echo ${name}
                    cleos create account eosio ${name}   LCN7sK2gymBFcnPLAGCL375ZW7NUCKqNXwX5d3VN4Y2ooNGW15UQh
                    [[ $? != 0 ]] && echo "create ${name} error" && return

                    cleos --print-request --print-response set contract ${name}        /root/eosio.deploy/contracts/eosio.system/
                    [[ $? != 0 ]] && echo "set contract ${name} error" && return
                done
            done
        done
    done
}


function mytest() {
    for ((i = 1; i <= 5 ; i++))
    do
        eval x$i="xxx$i"
    done

    echo --------------

    for ((i = 1; i <= 5 ; i++))
    do
        eval echo \$x$i
        alias aaa$i='mkdir -p '\$x''$i''
    done

    ls
    echo ++++++++++++++

    for ((i = 1; i <= 5 ; i++))
    do
        eval aaa${i}
    done
    ls
}

function mytest1()
{    
    if [[ $1 == "" ]]
    then
        start=1
    else
        start=$1
    fi

    if [[ $2 == "" ]]
    then
        end=21
    else
        end=$2
    fi

    echo $start, $end
}