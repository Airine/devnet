# Private network set up guide for [WiFi-Drizzle]()

To start the PoA network, simply run `docker-compose up`. By default, only the
first node defined in the addresses array will be allowed to seal with following:

- Initializes the data directory with a testing genesis block
- Sets max peers to 0
- Turns off discovery by other nodes
- Sets the gas price to 0
- Uses the Clique PoA consensus engine with which allows blocks to be mined as-needed without excessive CPU and memory consumption
- Uses on-demand block generation, producing blocks when there are transactions waiting to be mined

