# About

An example implementation of https://github.com/tumblr/colossus/tree/master/colossus-examples/src/main/scala/colossus-examples
 using:

 * SBT
 * Vagrant
 * Colossus
 * Scala
 * Puppet
 * Redis

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

### Telnet Server

Connect

```bash
telnet 10.10.10.50 10010
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


