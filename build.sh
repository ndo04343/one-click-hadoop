#!/bin/bash

NUM_OF_SLAVES=3

echo "------------------------------------------------"
echo ""
echo ""
echo "          Welcome to One Click Hadoop           "
echo ""
echo "  Latest update : 20210805"
echo "  Trash version"
echo "  I'll not repair this code!"
echo "  You might be test user of hadoop!"
echo "  So, just use 3 slave nodes!"
echo "------------------------------------------------"

echo "[1/3]Composing docker containers..."
docker-compose up -d
if [ $? -ne 0 ];then
    exit 1
fi

echo "[2/3]Linking slavenode..."
chmod +x slave_linker.sh
if [ $? -ne 0 ];then
    exit 2
fi

./slave_linker.sh $NUM_OF_SLAVES
if [ $? -ne 0 ];then
    exit 3
fi

echo "[3/3]Starting hadoop service..."
docker exec hadoop-master start-all.sh

echo "Complete!"
echo "Hadoop running!"
echo "--------"
echo "Number of slaves : $NUM_OF_SLAVES"
echo "Ports : "
echo "host 60001: guest 50010"
echo "host 60002: guest 50020"
echo "host 60003: guest 50070"
echo "host 60004: guest 50075"
echo "host 60005: guest 50090"
echo "host 60006: guest 8020"
echo "host 60007: guest 9000"
echo "host 60008: guest 10020"
echo "host 60009: guest 19888"
echo "host 60010: guest 8030"
echo "host 60011: guest 8031"
echo "host 60012: guest 8032"
echo "host 60013: guest 8033"
echo "host 60014: guest 8040"
echo "host 60015: guest 8042"
echo "host 60016: guest 8088"
echo "host 60017: guest 49707"
echo "host 2122:: guest 122"