#! /bin/bash -x

source ~/eosio.deploy/scripts/main.env.sh

function create_system_accounts() {
    echo -e "+ $FUNCNAME"

    cleos create account eosio eosio.bpay   LCN4v7RiXYWKmKZFEJqamLmFjbqdJRfoRf8HbtBn4u6Sg3UGazVzD ;eval $error_d_m
    cleos create account eosio eosio.msig   LCN7sK2gymBFcnPLAGCL375ZW7NUCKqNXwX5d3VN4Y2ooNGW15UQh ;eval $error_d_m
    cleos create account eosio eosio.names  LCN5n442Qz4yVc4LbdPCDnxNSseAiUCrNjRxAfPhUvM8tWS5svid6 ;eval $error_d_m
    cleos create account eosio eosio.ram    LCN7SDiMZ3KuWebCPH6EPdkxNaX57AuWiFzg6iY4awhhBLkdiFKvo ;eval $error_d_m
    cleos create account eosio eosio.ramfee LCN8J1FRUnEyYehJtuuHvAxJ8oTMFDd11xkvXXpD8b6YdyijvXJ5d ;eval $error_d_m
    cleos create account eosio eosio.saving LCN5Hrdbz2xMiZHMzvc1yY5X1Fwfa4d92Zq8Cg69TjENEDXEtSeKd ;eval $error_d_m
    cleos create account eosio eosio.stake  LCN7q9mWDVRq9RxvmhW5KQbCDtRz2qfz4Js4MMGJyUqCbfKT3tkZQ ;eval $error_d_m
    cleos create account eosio eosio.token  LCN7mgmVaLC6DrTqTVM6SsqGgur77vy3dmNJ6emghKzGLC9c3GLmZ ;eval $error_d_m
    cleos create account eosio eosio.vpay   LCN7MjRVDknqZqhYKr179Ua87AqPByyFkoPs1c4TeZG8rTx4kGnoQ ;eval $error_d_m
    cleos create account eosio eosio.res    LCN53w4BB8PSBPx6LDRVWgw6CwCrnfo6YbDgtbjriY5KxJAJ7mZW6 ;eval $error_d_m
    cleos create account eosio eosio.stable LCN6KAjri8wPQqLpA5rB7j3EBNJEN3zDEKcNVAt1L1L2YgLiJFHq5 ;eval $error_d_m
    cleos create account eosio eosio.divide LCN6im7ULvJGAzZM8jR1F5CTfoZaaCxDsELyLvWXnNF84mNkDr9PC ;eval $error_d_m
    cleos create account eosio eosio.pool   LCN7SguZDKGGAiAJ8BF7dAZKAU8DyTK1JQ3gYPt2cfbbKgbpHBLPu ;eval $error_d_m
    cleos create account eosio eosio.bonus  LCN7umegFdkyoqnFKiVvXqZSqSYyy7mYC2cFMjP5yATnCiYViPXYZ ;eval $error_d_m

    cleos set contract eosio.token  /root/eosio.deploy/contracts/eosio.token/  ;eval $error_d_m
    cleos set contract eosio.stable /root/eosio.deploy/contracts/eosio.token/  ;eval $error_d_m
    cleos set contract eosio.res    /root/eosio.deploy/contracts/eosio.res/    ;eval $error_d_m
    cleos set contract eosio.msig   /root/eosio.deploy/contracts/eosio.msig/   ;eval $error_d_m
    cleos set contract eosio        /root/eosio.deploy/contracts/eosio.system/ ;eval $error_d_m

    cleos push action eosio.token  create '["eosio", "10000000000.0000 LCN"]' -p eosio.token   ;eval $error_d_m
    cleos push action eosio.stable create '["eosio", "10000000000.0000 LCNY"]' -p eosio.stable ;eval $error_d_m
    cleos push action eosio.res    create '["eosio", "1125899906842624 RAM"]' -p eosio.res     ;eval $error_d_m
    cleos push action eosio.res    create '["eosio", "10000000000.0000 PDV"]' -p eosio.res     ;eval $error_d_m
    cleos push action eosio.res    create '["eosio", "10000000000.0000 ARV"]' -p eosio.res     ;eval $error_d_m
    cleos push action eosio.res    create '["eosio", "10000000000.0000 NET"]' -p eosio.res     ;eval $error_d_m
    cleos push action eosio.res    create '["eosio", "10000000000.0000 CPU"]' -p eosio.res     ;eval $error_d_m

    cleos push action eosio setpriv '["eosio.msig", 1]' -p eosio@active                        ;eval $error_d_m
    cleos push action eosio setpriv '["eosio.res", 1]' -p eosio@active                         ;eval $error_d_m

    cleos push action eosio.token  issue '["eosio", "1000000000.0000 LCN", "memo"]' -p eosio   ;eval $error_d_m
    cleos push action eosio.stable issue '["eosio", "1000000000.0000 LCNY", "memo"]' -p eosio  ;eval $error_d_m
    cleos push action eosio init '["0", "4,LCN", "4,LCNY"]' -p eosio@active                    ;eval $error_d_m

    cleos set account permission eosio.token active '{"threshold": 1,"keys": [{"key": "LCN7mgmVaLC6DrTqTVM6SsqGgur77vy3dmNJ6emghKzGLC9c3GLmZ","weight": 1}],"accounts": [{"permission":{"actor":"eosio.token","permission":"eosio.code"},"weight":1}]}' owner -p eosio.token   ;eval $error_d_m
    #cleos set account permission eosio.pool  active '{"threshold": 1,"keys": [],"accounts": [{"permission":{"actor":"eosio.divide","permission":"eosio.code"},"weight":1}]}' owner -p eosio.pool     ;eval $error_d_m
    #cleos set account permission eosio.bonus active '{"threshold": 1,"keys": [],"accounts": [{"permission":{"actor":"eosio.divide","permission":"eosio.code"},"weight":1}]}' owner -p eosio.bonus    ;eval $error_d_m

    eval $success_m
}

function create_agent_accounts() {
    echo -e "+ $FUNCNAME"

    cleos create account eosio $agent_actor_name $agent_actor_pubkey $agent_actor_pubkey    	;eval $error_d_m

    eval $success_m
}

function deploy_system_contracts() {
    echo -e "+ $FUNCNAME"

    unlock_wallet           ;eval $error_d_m
    create_system_accounts  ;eval $error_d_m
    create_agent_accounts   ;eval $error_d_m

    eval $success_m
}
