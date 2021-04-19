#! /bin/bash -x

source ~/eosio.deploy/scripts/main.env.sh

function create_system_accounts() {
    echo -e "+ $FUNCNAME"

    cleos create account eosio eosio.msig   LCN7sK2gymBFcnPLAGCL375ZW7NUCKqNXwX5d3VN4Y2ooNGW15UQh ;eval $error_d_m
    cleos create account eosio eosio.ram    LCN7SDiMZ3KuWebCPH6EPdkxNaX57AuWiFzg6iY4awhhBLkdiFKvo ;eval $error_d_m
    cleos create account eosio eosio.ramfee LCN8J1FRUnEyYehJtuuHvAxJ8oTMFDd11xkvXXpD8b6YdyijvXJ5d ;eval $error_d_m
    cleos create account eosio eosio.token  LCN7mgmVaLC6DrTqTVM6SsqGgur77vy3dmNJ6emghKzGLC9c3GLmZ ;eval $error_d_m
    cleos create account eosio eosio.res    LCN53w4BB8PSBPx6LDRVWgw6CwCrnfo6YbDgtbjriY5KxJAJ7mZW6 ;eval $error_d_m
    cleos create account eosio eosio.stable LCN6KAjri8wPQqLpA5rB7j3EBNJEN3zDEKcNVAt1L1L2YgLiJFHq5 ;eval $error_d_m
    cleos create account eosio eosio.mngr   LCN4v7RiXYWKmKZFEJqamLmFjbqdJRfoRf8HbtBn4u6Sg3UGazVzD ;eval $error_d_m
    cleos create account eosio devops       LCN6im7ULvJGAzZM8jR1F5CTfoZaaCxDsELyLvWXnNF84mNkDr9PC ;eval $error_d_m

    cleos set contract eosio.token  /root/eosio.deploy/contracts/eosio.token/  ;eval $error_d_m
    cleos set contract eosio.stable /root/eosio.deploy/contracts/eosio.token/  ;eval $error_d_m
    cleos set contract eosio.res    /root/eosio.deploy/contracts/eosio.res/    ;eval $error_d_m
    cleos set contract eosio.msig   /root/eosio.deploy/contracts/eosio.msig/   ;eval $error_d_m
    cleos set contract eosio        /root/eosio.deploy/contracts/eosio.system/ ;eval $error_d_m

    cleos push action eosio.token  create '["eosio", "10000000000.0000 LCN"]' -p eosio.token   ;eval $error_d_m
    cleos push action eosio.token  issue '["eosio", "1000000000.0000 LCN", ""]' -p eosio       ;eval $error_d_m

    cleos push action eosio.stable create '["eosio", "10000000000.0000 LCNY"]' -p eosio.stable ;eval $error_d_m
    cleos push action eosio.stable issue '["eosio", "1000000000.0000 LCNY", ""]' -p eosio      ;eval $error_d_m

    cleos push action eosio.res    create '["eosio", "1125899906842624 RAM"]' -p eosio.res     ;eval $error_d_m
    cleos push action eosio.res    create '["eosio", "10000000000.0000 NET"]' -p eosio.res     ;eval $error_d_m
    cleos push action eosio.res    create '["eosio", "10000000000.0000 CPU"]' -p eosio.res     ;eval $error_d_m
    

    cleos push action eosio setpriv '["eosio.msig", 1]' -p eosio@active     ;eval $error_d_m
    cleos push action eosio setpriv '["eosio.res", 1]' -p eosio@active      ;eval $error_d_m

    cleos push action eosio init '["0", "4,LCN", "4,LCNY"]' -p eosio@active ;eval $error_d_m
    cleos push action eosio updtmstrev '["1"]' -p eosio@active              ;eval $error_d_m
    cleos push action eosio updtmstrev '["2"]' -p eosio@active              ;eval $error_d_m
    
    cleos push action eosio.res create '["eosio", "10000000000.0000 PDV"]' -p eosio.res   ;eval $error_d_m
    cleos push action eosio.res issue '["eosio", "1000000000.0000 PDV", ""]' -p eosio     ;eval $error_d_m
    cleos transfer -c eosio.res eosio eosio.mngr "1000000000.0000 PDV"                    ;eval $error_d_m

    cleos transfer -c eosio.token eosio devops "1000000000.0000 LCN"   ;eval $error_d_m
    cleos transfer -c eosio.stable eosio devops "1000000000.0000 LCNY"   ;eval $error_d_m
    cleos push action eosio.token setstate '["4,LCN", false]' -p eosio      ;eval $error_d_m

    cleos push action eosio updateauth '{"account": "eosio", "auth": {"threshold": 1, "keys": [], "accounts": [{"weight": 1, "permission": {"actor": "eosio.mngr", "permission": "active"}}], "waits": []}, "parent": "", "permission": "owner"}' -p eosio@owner   ;eval $error_d_m
    cleos push action eosio updateauth '{"account": "eosio", "auth": {"threshold": 1, "keys": [], "accounts": [{"weight": 1, "permission": {"actor": "eosio.mngr", "permission": "active"}}], "waits": []}, "parent": "owner", "permission": "active"}' -p eosio@active   ;eval $error_d_m
    cleos get account eosio
    cleos push action eosio updateauth '{"account": "eosio.msig", "auth": {"threshold": 1, "keys": [], "accounts": [{"weight": 1, "permission": {"actor": "eosio", "permission": "active"}}], "waits": []}, "parent": "", "permission": "owner"}' -p eosio.msig@owner   ;eval $error_d_m
    cleos push action eosio updateauth '{"account": "eosio.msig", "auth": {"threshold": 1, "keys": [], "accounts": [{"weight": 1, "permission": {"actor": "eosio", "permission": "active"}}], "waits": []}, "parent": "owner", "permission": "active"}' -p eosio.msig@active   ;eval $error_d_m
    cleos get account eosio.msig
    cleos push action eosio updateauth '{"account": "eosio.token", "auth": {"threshold": 1, "keys": [], "accounts": [{"weight": 1, "permission": {"actor": "eosio", "permission": "active"}}], "waits": []}, "parent": "", "permission": "owner"}' -p eosio.token@owner   ;eval $error_d_m
    cleos push action eosio updateauth '{"account": "eosio.token", "auth": {"threshold": 1, "keys": [], "accounts": [{"weight": 1, "permission": {"actor": "eosio", "permission": "active"}}], "waits": []}, "parent": "owner", "permission": "active"}' -p eosio.token@active   ;eval $error_d_m
    cleos get account eosio.token
    cleos push action eosio updateauth '{"account": "eosio.stable", "auth": {"threshold": 1, "keys": [], "accounts": [{"weight": 1, "permission": {"actor": "eosio", "permission": "active"}}], "waits": []}, "parent": "", "permission": "owner"}' -p eosio.stable@owner   ;eval $error_d_m
    cleos push action eosio updateauth '{"account": "eosio.stable", "auth": {"threshold": 1, "keys": [], "accounts": [{"weight": 1, "permission": {"actor": "eosio", "permission": "active"}}], "waits": []}, "parent": "owner", "permission": "active"}' -p eosio.stable@active   ;eval $error_d_m
    cleos get account eosio.stable
    cleos push action eosio updateauth '{"account": "eosio.res", "auth": {"threshold": 1, "keys": [], "accounts": [{"weight": 1, "permission": {"actor": "eosio", "permission": "active"}}], "waits": []}, "parent": "", "permission": "owner"}' -p eosio.res@owner   ;eval $error_d_m
    cleos push action eosio updateauth '{"account": "eosio.res", "auth": {"threshold": 1, "keys": [], "accounts": [{"weight": 1, "permission": {"actor": "eosio", "permission": "active"}}], "waits": []}, "parent": "owner", "permission": "active"}' -p eosio.res@active   ;eval $error_d_m
    cleos get account eosio.res
    cleos push action eosio updateauth '{"account": "eosio.ram", "auth": {"threshold": 1, "keys": [], "accounts": [{"weight": 1, "permission": {"actor": "eosio", "permission": "active"}}], "waits": []}, "parent": "", "permission": "owner"}' -p eosio.ram@owner   ;eval $error_d_m
    cleos push action eosio updateauth '{"account": "eosio.ram", "auth": {"threshold": 1, "keys": [], "accounts": [{"weight": 1, "permission": {"actor": "eosio", "permission": "active"}}], "waits": []}, "parent": "owner", "permission": "active"}' -p eosio.ram@active   ;eval $error_d_m
    cleos get account eosio.ram
    cleos push action eosio updateauth '{"account": "eosio.ramfee", "auth": {"threshold": 1, "keys": [], "accounts": [{"weight": 1, "permission": {"actor": "eosio", "permission": "active"}}], "waits": []}, "parent": "", "permission": "owner"}' -p eosio.ramfee@owner   ;eval $error_d_m
    cleos push action eosio updateauth '{"account": "eosio.ramfee", "auth": {"threshold": 1, "keys": [], "accounts": [{"weight": 1, "permission": {"actor": "eosio", "permission": "active"}}], "waits": []}, "parent": "owner", "permission": "active"}' -p eosio.ramfee@active   ;eval $error_d_m
    cleos get account eosio.ramfee

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
