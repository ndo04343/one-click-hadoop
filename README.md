# One Click Hadoop

### 0. Overview
Forked from kmu-bigdata/ubuntu-hadoop.<br>
Above kmu-bigdata/ubuntu-hadoop use 50070 port and stuff like that, <br>
but since hadoop version 3, there are some change in port informations. <br>
- Namenode ports: 50470 --> 9871, 50070 --> 9870, 8020 --> 9820
- Secondary NN ports: 50091 --> 9869, 50090 --> 9868
- Datanode ports: 50020 --> 9867, 50010 --> 9866, 50475 --> 9865, 50075 --> 9864
- KMS server port : 16000 --> 9600

And I need to use hadoop:2.7.7. <br>
So I changed something. <br>
<br>

### 1. Fast start
Run it in the terminal like this:
```
./build.sh
```
And use hadoop.<br><br>

DockerHub : [https://hub.docker.com/r/leibniz21c/ubuntu-hadoop](https://hub.docker.com/r/leibniz21c/ubuntu-hadoop)
