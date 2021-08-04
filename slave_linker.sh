#!/bin/bash
#       
#       Hadoop slave node setting script
#       2021.08.05      leibniz21c
#       Usage :
#       $ chmod +x slave_linker.sh
#       $ ./slave_linker.sh [NUMBER_OF_SLAVE_NODES]
#
NUM_OF_SLAVE=$1
ADD_SLAVE=""
RESULT=""
INDEX=1

HADOOP_HOME=/usr/local/hadoop

WORKERS_FILE="\$HADOOP_HOME/etc/hadoop/workers"
while [ $INDEX -lt $((NUM_OF_SLAVE)) ];
do
        ADD_SLAVE="slave$INDEX\n"
        RESULT="$RESULT$ADD_SLAVE"
        INDEX=$(($INDEX+1))
done
RESULT="${RESULT}master\n"

sudo docker exec hadoop-master bash -c "echo -e $RESULT > $WORKERS_FILE"
if [ $? -eq 0 ];then
        echo "< ADDED : $HADOOP_HOME/etc/hadoop/workers >"
        echo "$RESULT"
else
        echo "[ERROR] : Please create a container named hadoop-master using the image leibniz21c/ubuntu-hadoop:2.7.7."
        echo "< NOT ADDED >"
        echo "$RESULT"