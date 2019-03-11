# DNS gazer docker image
Original repository is https://github.com/m-mizutani/dns-gazer

### Usage
Environment Variable
`DEVICE`: Specify monitoring device, such as `eth0`
`FLUENTD_ADDRESS`: Destination of fluentd forward input plugin, e.g. `127.0.0.1:24224`
Example
`--net=host` is required because the docker container need to monitor network interface directly.

```
$ docker run --net=host -e DEVICE=eth0 -e FLUENTD_ADDRESS=localhost:24224 mztn/dns-gazer
```
