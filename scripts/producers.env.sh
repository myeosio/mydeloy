#! /bin/bash -x
source ~/eosio.deploy/scripts/env.sh
source ~/eosio.deploy/scripts/main.env.sh

producers_size=21

producer1_name=producer111a
producer2_name=producer111b
producer3_name=producer111c
producer4_name=producer111d
producer5_name=producer111e
producer6_name=producer111f
producer7_name=producer111g
producer8_name=producer111h
producer9_name=producer111i
producer10_name=producer111j
producer11_name=producer111k
producer12_name=producer111l
producer13_name=producer111m
producer14_name=producer111n
producer15_name=producer111o
producer16_name=producer111p
producer17_name=producer111q
producer18_name=producer111r
producer19_name=producer111s
producer20_name=producer111t
producer21_name=producer111u

producer1_http_port=8001
producer2_http_port=8002
producer3_http_port=8003
producer4_http_port=8004
producer5_http_port=8005
producer6_http_port=8006
producer7_http_port=8007
producer8_http_port=8008
producer9_http_port=8009
producer10_http_port=8010
producer11_http_port=8011
producer12_http_port=8012
producer13_http_port=8013
producer14_http_port=8014
producer15_http_port=8015
producer16_http_port=8016
producer17_http_port=8017
producer18_http_port=8018
producer19_http_port=8019
producer20_http_port=8020
producer21_http_port=8021

producer1_p2p_port=9001
producer2_p2p_port=9002
producer3_p2p_port=9003
producer4_p2p_port=9004
producer5_p2p_port=9005
producer6_p2p_port=9006
producer7_p2p_port=9007
producer8_p2p_port=9008
producer9_p2p_port=9009
producer10_p2p_port=9010
producer11_p2p_port=9011
producer12_p2p_port=9012
producer13_p2p_port=9013
producer14_p2p_port=9014
producer15_p2p_port=9015
producer16_p2p_port=9016
producer17_p2p_port=9017
producer18_p2p_port=9018
producer19_p2p_port=9019
producer20_p2p_port=9020
producer21_p2p_port=9021

#producer111a
producer1_pubkey=LCN4xaKNxWANohKQ4fb7F9ujAjoP9ZY8qYttnhgvj54a5Wt1kv65V
producer1_prvkey=5JtvAi2QxZdWVK2aKqH4KkeNg1hSNWguXbohxyH3D1C6p8o4yhk

#producer111b
producer2_pubkey=LCN5bbSZ2TmsCcdY775QTD7P9rSAMotXyQmkKXuDCfEBMKxDHNbJq
producer2_prvkey=5KT3Tb761pzyU5pzNMGkRYqzuLvK1rDBTPRTV1v7gQa3QTS7dGL

#producer111c
producer3_pubkey=LCN6efebeRvoPH71VoD8WPLZXHBS5x9D28jQQvtxhpH5cuE72KtGt
producer3_prvkey=5KR2ijRjCQrfjfVMWg4WymxGmeQwt4Ug4ubQCne5zhsYYDyieB8

#producer111d
producer4_pubkey=LCN4xCgSkoCcAunwYfWoZoGxHnvf5cKL5a3zyFTwjn3jdECxXzZhh
producer4_prvkey=5KVpnvLYF4b6Vw22xT69Y839kNUfj5PVHtmsnC2EeWADQfBzgAj

#producer111e
producer5_pubkey=LCN5gtjCrQQ3nbeVKw4md8JQwNYT1NNx3VNMmaQe5sdpubdFc24Hk
producer5_prvkey=5JjnzCxZF2amg9WsYNuHYnesdmqhiQvNtR63f87KHQPwZDRiNS9

#producer111f
producer6_pubkey=LCN8muHsYPVuoSUUHSDgLnJJismg9hxhCNJJ3JvbKAsykqGd9bfEr
producer6_prvkey=5JCGoWQSeZFcoHgFcVicCJskvuQvq89YFa2HhqAr1V9kvwPCSZn

#producer111g
producer7_pubkey=LCN7mkqf9YLRGGi8zM3TkkZxxMqMi7CeEJToEpehprxJj2JoBkvzR
producer7_prvkey=5K1ppMDm2q38oJuicQD2AjFyfJT7S9y8h1scPNKSLAYm86bNdZy

#producer111h
producer8_pubkey=LCN8Mvva8am4acWbfWq5fFL2pArtNSe3A4oubK3DEZ6n1ogdBWMmT
producer8_prvkey=5KFrYvZqLn8Jqn5RzaGu37vY9uwyKzEFXYYSD2mNxBGJzVopVLp

#producer111i
producer9_pubkey=LCN7WutBAf585kujPEsWHJck34Xd9LDydXSDaCAxAsN52NwAas4bV
producer9_prvkey=5JX9Eb7Peg57hx1QimyJYgBdB6CbFqWmw57DYD5NM3ddUnF3NBp

#producer111j
producer10_pubkey=LCN6aMBWGq6shuDXVcA3YH6kBdjBe8vLqxHsAC93R6vgVHfJazUn2
producer10_prvkey=5Httf66dVNcvps9JiQPHdsx5WUaMR5qnKDgUwjnPSQmgoJhUDTD

#producer111k
producer11_pubkey=LCN8kiVGwbpS1N3ZDNzFwyF6P6TssFUX4LPMLnnzpSNM9xM5qbesw
producer11_prvkey=5KVgT7gGcSAD7AxVTTLeUDP4R24JrSGKK714G4QRegFwz1TkiCE

#producer111l
producer12_pubkey=LCN5L6FB2xWbPcYVgx72qU8upLi84gc1WAvta2BuznTwkdgt7HKRE
producer12_prvkey=5JQZ35gdjzyuNvptZcQBAW6zFAtXqcJVaGqN9Fz7HKFGSgSBpGu

#producer111m
producer13_pubkey=LCN8Mh6jYUyxVzKS3VqNV7scDLq1pmY8e72m95rmsqh8Whx2YchG5
producer13_prvkey=5JM5JhpfUpsPyVBSa9HTeFxDPnDHs4EKg73AiMSu5jyDthunVEY

#producer111n
producer14_pubkey=LCN5Z8anjeNHyTsqytWap8eeEDADUg9V8sBhfkJXmLE3nTh93xbcg
producer14_prvkey=5JSYNXhJCUGqntShzxfcVXRr7nbPedxYMq9S834XAqhKa3Eezdm

#producer111o
producer15_pubkey=LCN8RwdYEuuJLwSYkGSw4nPscmVQvbmQtRAngNonBo4cX3QThvRzF
producer15_prvkey=5K2QDf6ncq8Nq5gug8b4xZo8R5UR9yhiQR8nWupVmig13dYuQre

#producer111p
producer16_pubkey=LCN5RQ9uP5rQTn3jaf6kVDqnYzeWJHKMmo8e4wqtH5p6Xvn8Hvwuy
producer16_prvkey=5JqqzpsQSpoY4tCAcytxFyHDkESqoHf1E1n1nDM7RUDev2h8rQT

#producer111q
producer17_pubkey=LCN7brh9FiQ9psSNLPFe2wPqyB7pRk1e5FgKDqFJmYMwEoHzsbRDd
producer17_prvkey=5JWT7yUkKoJAi1Bf6qeYahBF8HKjnHRBeeMptrpnGhDWChfNn2A

#producer111r
producer18_pubkey=LCN8AnYPkmeGxwWQpjdfXFCJtvePToCNsJKCg76F3oxtfU82qkDgk
producer18_prvkey=5JeDQ1Xzy63G8ZCGSYCjb3zB2xs3YsFsGWVu9nFQWxx8tHi7H3n

#producer111s
producer19_pubkey=LCN5YQ7G1wWD1uAHvWYRRYYwirV8zopenGS4aeLYz4tVomWkAaWX9
producer19_prvkey=5JP8et3Yy1pCTyWAnqGrTAGpBeugeqshP5i3vWiNeTdaJygZGFX

#producer111t
producer20_pubkey=LCN8DQBWGVKyGAympV3T3kLcqHk3YR3BmoxcK7c8vMZVNx1K1Jeg4
producer20_prvkey=5JmgVg1NGPv3tgRSrwdFYeMkvDiERnHp1f8ogPkQpt1FDfvCd6x

#producer111u
producer21_pubkey=LCN8GcXgbiVqpFhVTGnKMmJj8ek2znwJfmeopST7nbPMWmdESJzKL
producer21_prvkey=5K5JgvWB5cPSneqie7HHqRe2fheA8oM9DfHTmhUmQ2qF1Vhgcoj

producers_dir=$eosio_dir/producers

producer1_dir=$producers_dir/$producer1_name
producer2_dir=$producers_dir/$producer2_name
producer3_dir=$producers_dir/$producer3_name
producer4_dir=$producers_dir/$producer4_name
producer5_dir=$producers_dir/$producer5_name
producer6_dir=$producers_dir/$producer6_name
producer7_dir=$producers_dir/$producer7_name
producer8_dir=$producers_dir/$producer8_name
producer9_dir=$producers_dir/$producer9_name
producer10_dir=$producers_dir/$producer10_name
producer11_dir=$producers_dir/$producer11_name
producer12_dir=$producers_dir/$producer12_name
producer13_dir=$producers_dir/$producer13_name
producer14_dir=$producers_dir/$producer14_name
producer15_dir=$producers_dir/$producer15_name
producer16_dir=$producers_dir/$producer16_name
producer17_dir=$producers_dir/$producer17_name
producer18_dir=$producers_dir/$producer18_name
producer19_dir=$producers_dir/$producer19_name
producer20_dir=$producers_dir/$producer20_name
producer21_dir=$producers_dir/$producer21_name

producer1_cmd="$nodeos_args -e -d $producer1_dir/ --http-server-address=0.0.0.0:$producer1_http_port --p2p-listen-endpoint=0.0.0.0:$producer1_p2p_port $nodeos_sync_main_peer_args $nodeos_sync_peer2_args $nodeos_sync_peer3_args -p $producer1_name --private-key [\"$producer1_pubkey\",\"$producer1_prvkey\"]"
producer2_cmd="$nodeos_args -e -d $producer2_dir/ --http-server-address=0.0.0.0:$producer2_http_port --p2p-listen-endpoint=0.0.0.0:$producer2_p2p_port $nodeos_sync_main_peer_args $nodeos_sync_peer1_args $nodeos_sync_peer3_args -p $producer2_name --private-key [\"$producer2_pubkey\",\"$producer2_prvkey\"]"
producer3_cmd="$nodeos_args -e -d $producer3_dir/ --http-server-address=0.0.0.0:$producer3_http_port --p2p-listen-endpoint=0.0.0.0:$producer3_p2p_port $nodeos_sync_main_peer_args $nodeos_sync_peer1_args $nodeos_sync_peer2_args -p $producer3_name --private-key [\"$producer3_pubkey\",\"$producer3_prvkey\"]"
producer4_cmd="$nodeos_args -e -d $producer4_dir/ --http-server-address=0.0.0.0:$producer4_http_port --p2p-listen-endpoint=0.0.0.0:$producer4_p2p_port $nodeos_sync_main_peer_args $nodeos_sync_peer1_args $nodeos_sync_peer2_args $nodeos_sync_peer3_args -p $producer4_name --private-key [\"$producer4_pubkey\",\"$producer4_prvkey\"]"
producer5_cmd="$nodeos_args -e -d $producer5_dir/ --http-server-address=0.0.0.0:$producer5_http_port --p2p-listen-endpoint=0.0.0.0:$producer5_p2p_port $nodeos_sync_main_peer_args $nodeos_sync_peer1_args $nodeos_sync_peer2_args $nodeos_sync_peer3_args -p $producer5_name --private-key [\"$producer5_pubkey\",\"$producer5_prvkey\"]"
producer6_cmd="$nodeos_args -e -d $producer6_dir/ --http-server-address=0.0.0.0:$producer6_http_port --p2p-listen-endpoint=0.0.0.0:$producer6_p2p_port $nodeos_sync_main_peer_args $nodeos_sync_peer1_args $nodeos_sync_peer2_args $nodeos_sync_peer3_args -p $producer6_name --private-key [\"$producer6_pubkey\",\"$producer6_prvkey\"]"
producer7_cmd="$nodeos_args -e -d $producer7_dir/ --http-server-address=0.0.0.0:$producer7_http_port --p2p-listen-endpoint=0.0.0.0:$producer7_p2p_port $nodeos_sync_main_peer_args $nodeos_sync_peer1_args $nodeos_sync_peer2_args $nodeos_sync_peer3_args -p $producer7_name --private-key [\"$producer7_pubkey\",\"$producer7_prvkey\"]"
producer8_cmd="$nodeos_args -e -d $producer8_dir/ --http-server-address=0.0.0.0:$producer8_http_port --p2p-listen-endpoint=0.0.0.0:$producer8_p2p_port $nodeos_sync_main_peer_args $nodeos_sync_peer1_args $nodeos_sync_peer2_args $nodeos_sync_peer3_args -p $producer8_name --private-key [\"$producer8_pubkey\",\"$producer8_prvkey\"]"
producer9_cmd="$nodeos_args -e -d $producer9_dir/ --http-server-address=0.0.0.0:$producer9_http_port --p2p-listen-endpoint=0.0.0.0:$producer9_p2p_port $nodeos_sync_main_peer_args $nodeos_sync_peer1_args $nodeos_sync_peer2_args $nodeos_sync_peer3_args -p $producer9_name --private-key [\"$producer9_pubkey\",\"$producer9_prvkey\"]"
producer10_cmd="$nodeos_args -e -d $producer10_dir/ --http-server-address=0.0.0.0:$producer10_http_port --p2p-listen-endpoint=0.0.0.0:$producer10_p2p_port $nodeos_sync_main_peer_args $nodeos_sync_peer1_args $nodeos_sync_peer2_args $nodeos_sync_peer3_args -p $producer10_name --private-key [\"$producer10_pubkey\",\"$producer10_prvkey\"]"
producer11_cmd="$nodeos_args -e -d $producer11_dir/ --http-server-address=0.0.0.0:$producer11_http_port --p2p-listen-endpoint=0.0.0.0:$producer11_p2p_port $nodeos_sync_main_peer_args $nodeos_sync_peer1_args $nodeos_sync_peer2_args $nodeos_sync_peer3_args -p $producer11_name --private-key [\"$producer11_pubkey\",\"$producer11_prvkey\"]"
producer12_cmd="$nodeos_args -e -d $producer12_dir/ --http-server-address=0.0.0.0:$producer12_http_port --p2p-listen-endpoint=0.0.0.0:$producer12_p2p_port $nodeos_sync_main_peer_args $nodeos_sync_peer1_args $nodeos_sync_peer2_args $nodeos_sync_peer3_args -p $producer12_name --private-key [\"$producer12_pubkey\",\"$producer12_prvkey\"]"
producer13_cmd="$nodeos_args -e -d $producer13_dir/ --http-server-address=0.0.0.0:$producer13_http_port --p2p-listen-endpoint=0.0.0.0:$producer13_p2p_port $nodeos_sync_main_peer_args $nodeos_sync_peer1_args $nodeos_sync_peer2_args $nodeos_sync_peer3_args -p $producer13_name --private-key [\"$producer13_pubkey\",\"$producer13_prvkey\"]"
producer14_cmd="$nodeos_args -e -d $producer14_dir/ --http-server-address=0.0.0.0:$producer14_http_port --p2p-listen-endpoint=0.0.0.0:$producer14_p2p_port $nodeos_sync_main_peer_args $nodeos_sync_peer1_args $nodeos_sync_peer2_args $nodeos_sync_peer3_args -p $producer14_name --private-key [\"$producer14_pubkey\",\"$producer14_prvkey\"]"
producer15_cmd="$nodeos_args -e -d $producer15_dir/ --http-server-address=0.0.0.0:$producer15_http_port --p2p-listen-endpoint=0.0.0.0:$producer15_p2p_port $nodeos_sync_main_peer_args $nodeos_sync_peer1_args $nodeos_sync_peer2_args $nodeos_sync_peer3_args -p $producer15_name --private-key [\"$producer15_pubkey\",\"$producer15_prvkey\"]"
producer16_cmd="$nodeos_args -e -d $producer16_dir/ --http-server-address=0.0.0.0:$producer16_http_port --p2p-listen-endpoint=0.0.0.0:$producer16_p2p_port $nodeos_sync_main_peer_args $nodeos_sync_peer1_args $nodeos_sync_peer2_args $nodeos_sync_peer3_args -p $producer16_name --private-key [\"$producer16_pubkey\",\"$producer16_prvkey\"]"
producer17_cmd="$nodeos_args -e -d $producer17_dir/ --http-server-address=0.0.0.0:$producer17_http_port --p2p-listen-endpoint=0.0.0.0:$producer17_p2p_port $nodeos_sync_main_peer_args $nodeos_sync_peer1_args $nodeos_sync_peer2_args $nodeos_sync_peer3_args -p $producer17_name --private-key [\"$producer17_pubkey\",\"$producer17_prvkey\"]"
producer18_cmd="$nodeos_args -e -d $producer18_dir/ --http-server-address=0.0.0.0:$producer18_http_port --p2p-listen-endpoint=0.0.0.0:$producer18_p2p_port $nodeos_sync_main_peer_args $nodeos_sync_peer1_args $nodeos_sync_peer2_args $nodeos_sync_peer3_args -p $producer18_name --private-key [\"$producer18_pubkey\",\"$producer18_prvkey\"]"
producer19_cmd="$nodeos_args -e -d $producer19_dir/ --http-server-address=0.0.0.0:$producer19_http_port --p2p-listen-endpoint=0.0.0.0:$producer19_p2p_port $nodeos_sync_main_peer_args $nodeos_sync_peer1_args $nodeos_sync_peer2_args $nodeos_sync_peer3_args -p $producer19_name --private-key [\"$producer19_pubkey\",\"$producer19_prvkey\"]"
producer20_cmd="$nodeos_args -e -d $producer20_dir/ --http-server-address=0.0.0.0:$producer20_http_port --p2p-listen-endpoint=0.0.0.0:$producer20_p2p_port $nodeos_sync_main_peer_args $nodeos_sync_peer1_args $nodeos_sync_peer2_args $nodeos_sync_peer3_args -p $producer20_name --private-key [\"$producer20_pubkey\",\"$producer20_prvkey\"]"
producer21_cmd="$nodeos_args -e -d $producer21_dir/ --http-server-address=0.0.0.0:$producer21_http_port --p2p-listen-endpoint=0.0.0.0:$producer21_p2p_port $nodeos_sync_main_peer_args $nodeos_sync_peer1_args $nodeos_sync_peer2_args $nodeos_sync_peer3_args -p $producer21_name --private-key [\"$producer21_pubkey\",\"$producer21_prvkey\"]"

producer1_log=$producer1_dir/$log_file
producer2_log=$producer2_dir/$log_file
producer3_log=$producer3_dir/$log_file
producer4_log=$producer4_dir/$log_file
producer5_log=$producer5_dir/$log_file
producer6_log=$producer6_dir/$log_file
producer7_log=$producer7_dir/$log_file
producer8_log=$producer8_dir/$log_file
producer9_log=$producer9_dir/$log_file
producer10_log=$producer10_dir/$log_file
producer11_log=$producer11_dir/$log_file
producer12_log=$producer12_dir/$log_file
producer13_log=$producer13_dir/$log_file
producer14_log=$producer14_dir/$log_file
producer15_log=$producer15_dir/$log_file
producer16_log=$producer16_dir/$log_file
producer17_log=$producer17_dir/$log_file
producer18_log=$producer18_dir/$log_file
producer19_log=$producer19_dir/$log_file
producer20_log=$producer20_dir/$log_file
producer21_log=$producer21_dir/$log_file
