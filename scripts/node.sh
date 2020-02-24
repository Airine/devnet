#!/usr/bin/env ash

bootnode=$(getent hosts bootnode | awk '{print $1}')
datadir=/root/.ethereum
addresses="0x0f71252485B1DF8D3817D903ba7d0f97D016260b,0x68EF8a19b27d17aaEF230E4f75191c21cc87d4C2,0x01013657BFC9D315C2e48BF49fa15c1b21facd4F,0x68404a3bDf002Ebbe651e4A3F4668eFa8153c4b4,0x07876Abc0731B2E1086D300601066Fd2798a8F55,0xE132B81e86998479D4fdC14E6B885868FD0B4267,0xF325c379171627f28B83daF41AF9b464583f9286,0x8C60566F4925fcD61f0795Fdd1e162B104233606"

mkdir -p $datadir/keystore
cp -R /keystore $datadir

geth --datadir $datadir \
     --networkid "19990119" \
     --rpc --rpcaddr '0.0.0.0' --rpcport 8545 --rpccorsdomain '*' --rpcapi 'admin,db,eth,miner,net,web3,personal,txpool' \
     --ws --wsaddr '0.0.0.0' --wsport 8546 --wsorigins '*' \
     --unlock $addresses \
     --password "/dev/null" \
     --dev
     --dev.period 1 \
     --verbosity 3
