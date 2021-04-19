#! /bin/bash -x

source ~/eosio.deploy/scripts/main.env.sh

agent_actor_name=agent.main
agent_actor_pubkey=LCN6ETSKpitkwU5THGRzAv5QPwv4zgV3ncY9yAZo5K4bCn6UD9rmd
agent_actor_prvkey=5JjRntmbxfM8zKPeAohje7ur2R5dHsbpvgUDYwbef5FNgitmRYc
agent_actor="{\"name\":\"$agent_actor_name\",\"wif_keys\":[\"$agent_actor_prvkey\"]}"
multikey="[\"$agent_actor_prvkey\"]"
agents_size=16
agents_http_port_start=42000

agents_dir=$eosio_dir/$agents_dn
relay_middleware=http://123.56.179.72:8080
trace_middleware=http://123.56.179.72:8081

agent_cmd="eosio-agent -d $agents_dir/ --http-validate-host=false --verbose-http-errors --actor=$agent_actor --multikey=$multikey --nodeos-address=$producers_http --relay-address=$relay_middleware --trace-push-address=$trace_middleware"

