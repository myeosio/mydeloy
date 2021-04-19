#! /bin/bash -x

source ~/eosio.deploy/scripts/web.server.env.sh

function web_pull() {
    local PWD=$(pwd)

    ################################# static #####################################
    cd /var/www/web.service/financeadmin.ui                     ; git pull ; echo
    cd /var/www/web.service/billadmin.ui                        ; git pull ; echo
    cd /var/www/web.service/exchange.rate.contract.ui           ; git pull ; echo
    cd /var/www/web.service/direct.sell.contract.ui             ; git pull ; echo
    cd /var/www/web.service/direct.sell.contract.ui.client      ; git pull ; echo
    cd /var/www/web.service/lcny.stake.gm.contract.ui           ; git pull ; echo
    cd /var/www/web.service/auction.ui                          ; git pull ; echo
    cd /var/www/web.service/c2cpawn.ui                          ; git pull ; echo
    cd /var/www/web.service/eos.dex.ui                          ; git pull ; echo
    cd /var/www/web.service/shares.ui                           ; git pull ; echo
    cd /var/www/web.service/speed_exchange.ui                   ; git pull ; echo
    cd /var/www/web.service/register_trade_pair.ui              ; git pull ; echo
    cd /var/www/web.service/fast_send_currency.ui               ; git pull ; echo
    cd /var/www/web.service/resourceleasing                     ; git pull ; echo
    cd /var/www/web.service/redpackets.3.0.ui                   ; git pull ; echo
    cd /var/www/web.service/eos.bonus.ui                        ; git pull ; echo
    cd /var/www/web.service/financingmobile                     ; git pull ; echo
    cd /var/www/web.service/financingbackstage                  ; git pull ; echo
    cd /var/www/web.service/sellaandbuy                         ; git pull ; echo
    cd /var/www/web.service/invoicemobui                        ; git pull ; echo
    cd /var/www/web.service/tax                                 ; git pull ; echo
    cd /var/www/web.service/financepcadmin.ui                   ; git pull ; echo
    cd /var/www/web.service/pcp2fcl_ui                          ; git pull ; echo

    cd $PWD
}


#######################################################################################
function stop_explorer() {
    echo -e "+ $FUNCNAME"
    stop_wait_port $explorer_port
    eval $success_m
}

function start_explorer() {
    echo -e "+ $FUNCNAME"

    local PWD=$(pwd)

    cd $explorer_dir
    git checkout $eosio_branch && git pull 
    [[ $? != 0 ]] && cd $PWD && eval $error_d_m

    stop_explorer
    echo >$explorer_log

    echo $explorer_cmd
    nohup $explorer_cmd &>>$explorer_log & disown
    start_wait_port "node" "$explorer_port" 
    [[ $? != 0 ]] && cd $PWD && eval $error_d_m

    cd $PWD
    eval $success_m
}