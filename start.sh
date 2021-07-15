#!/usr/bin/env bash

network="--mixnet"
#network="--testnet"
#mining="--miningaddr TmWEiwhTJVVMn6p44wM75eSt2v478vwbiiK"
mining="--miningaddr TmYKjdMDTVfnHMutACib2QqYV9E8iaKAy5f"
#mining="--miningaddr RmSUtZ6kMqipWpUrmnyxMcGurghFVF3Asvi"
debug="-d debug --printorigin"
rpc="--rpclisten 127.0.0.1:1234 --rpcuser test --rpcpass test"
#p2p="--listen 0.0.0.0:3234"
path="-b "$(pwd)
#index="--txindex"
index=""
# notls="--notls"
ge="--generate 1"
modules="--modules=miner"
modules1="--modules=qitmeer"
externalip="--externalip=192.0.xx.xx"
#p2p="--listen 0.0.0.0:28130 --externalip=xx.xxx.xx.xxx:28130"
#1.) The start script used only for dev test purpose
#2.) the relative path of qitmeer executable link sould be the same path of the start.sh link
#3.) the "-b ." set the base data directory as the same place where the start script executed
#
# EX:
# $ WORK=/tmp/my_test_workspace
# $ mkdir -p $WORK
# $ cd $WORK
# $ ls -s /where/is/my/qitmeer/executable
# $ ln -s /where/is/my/qitmeer/start.sh
# $ ./start.sh
./build/bin/qitmeer $externalip $debug $rpc $path $index $network $mining $notls $modules $modules1 "$@"
# ./cmd/qitmeerd/qitmeerd