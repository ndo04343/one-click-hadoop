#!/bin/bash
#       
#       Hadoop slave node setting script
#       2021.08.05      leibniz21c
#       Usage :
#       $ chmod +x slave_linker.sh
#       $ ./slave_linker.sh [NUMBER_OF_SLAVE_NODES]
#
NUM_OF_SLAVES=$1
ADD_SLAVE=""
RESULT=""
INDEX=1

HADOOP_HOME=/usr/local/hadoop

SLAVES_FILE="$HADOOP_HOME/etc/hadoop/slaves"
while [ $INDEX -lt $((NUM_OF_SLAVES+1)) ];
do
        ADD_SLAVE="slave$INDEX'\'n"
        RESULT="$RESULT$ADD_SLAVE"
        INDEX=$(($INDEX+1))
done
RESULT="${RESULT}master"

sudo docker exec hadoop-master bash -c "echo -e $RESULT > $SLAVES_FILE"
if [ $? -eq 0 ];then
        echo "< ADDED : $HADOOP_HOME/etc/hadoop/slaves >"
        echo "$NUM_OF_SLAVES slaves added."
        exit 0
else
        echo "[ERROR] : Please create a container named hadoop-master using the image leibniz21c/ubuntu-hadoop:2.7.7."
        echo "< NOT ADDED >"
        exit 1
fi