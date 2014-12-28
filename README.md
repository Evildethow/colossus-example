# About

An example implementation of https://github.com/tumblr/colossus/tree/master/colossus-examples/src/main/scala/colossus-examples
 using:

 * SBT
 * Vagrant
 * Colossus
 * Scala
 * Puppet
 * Redis (redis-2.8.19)

## Build

```bash
sbt assembly
```

## Deploy & Run
```bash
cd vagrant
vagrant up
```

## Test

Run the following commands from vagrant box.

Access vagrant box
```bash
cd vagrant
vagrant ssh
```

Start service (starts automatically when vagrant started)
```bash
sudo service colossus-example start
```

Stop service
```bash
sudo service colossus-example stop
```

### Telnet Server

Connect

```bash
telnet localhost 9002
```

echo hello
```bash
# say <arg>
say hello
```

version
```bash
version
```

exit
```bash
exit
```

### Http Redis Server

Echo 'Hello World!'
```bash
wget -qO- http://localhost:9001
```

GET Request
```bash
# wget -qO- http://localhost:9001/get/<key>
wget -qO- http://localhost:9001/get/a
```

SET Request
```bash
# wget -qO- http://localhost:9001/set/<key>/<value>
wget -qO- http://localhost:9001/set/a/1
```





