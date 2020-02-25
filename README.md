# Private network set up guide for [WiFi-Drizzle](https://github.com/Airine/WiFi-Drizzle)

To start the PoA network, simply run `docker-compose up`. By default, only the
first node defined in the addresses array will be allowed to seal with following:

- Initializes the data directory with a testing genesis block
- Sets max peers to 0
- Turns off discovery by other nodes
- Sets the gas price to 0
- Uses the Clique PoA consensus engine with which allows blocks to be mined as-needed without excessive CPU and memory consumption
- Uses on-demand block generation, producing blocks when there are transactions waiting to be mined

## Run

Simply run command:
```bash
docker-compose up
```

## Connect

Use `geth attach` to open an interactive console connecting to running node:
```bash
geth attach http://127.0.0.1:8545 console
```

## Stop

Press `Control-C`

## Clean the chain data

After stop the running node: (Be carefull! This command would remove all the stopped docker container)
```bash
docker container prune
```


The easy web gui is at http://[ip to raspberry pi]/ (default: http://192.168.1.241), access code is goodforwifi
```
su
# password:8520
cd ~
```

## Set up

```
./run_proxy.sh

python3 solidity/owner.py

python infoserver.py

python user_page.py
```