# pvekit
`pvekit` is the tool that can batch process VM/LXC on PVE.

## Install
Please install and use in the PVE node shell.
```bash
git clone https://github.com/Vincent550102/pvekit
```


## Usage
see `-h/--help` for detail help.
### start/stop/reboot
```bash
./startvm.sh -s 100 -e 120
./stopvm.sh -s 100 -e 120
./rebootvm.sh -s 100 -e 120
```
### snapshot/rollback
```bash
./snapshotvm.sh -s 100 -e 120 -n mysnapshot
./rollbackvm.sh -s 100 -e 120 -n mysnapshot
```
