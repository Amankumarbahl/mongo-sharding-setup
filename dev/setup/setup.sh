sleep 30 | echo Sleeping0 30


#!/bin/sh
echo ************************************
echo Starting first replica Set
echo ************************************

mongo mongo-rs0-1:27017 rs0Setup.js

sleep 120 | echo Sleeping1 120

mongo --host rs0/mongo-rs0-1:27017,mongo-rs0-2:27018,mongo-rs0-2:27019 --eval "db.isMaster()"

#!/bin/sh
echo ************************************
echo Populating first replica Set
echo ************************************

mongo mongo-rs0-1:27017 < populate.js

sleep 120 | echo Sleeping2 120

#!/bin/sh
echo ************************************
echo Starting config server
echo ************************************

mongo mongo-rsc-1:27017 rscSetup.js

sleep 120 | echo Sleeping3 120

#!/bin/sh
echo ************************************
echo Starting local mongos
echo ************************************


mongos --configdb rsc/mongo-rsc-1:27018,mongo-rsc-2:27018,mongo-rsc-3:27019  --bind_ip 0.0.0.0 --fork --logpath /var/tmp/mongodb.log -vvvvv

sleep 120 | echo Sleeping4 120

echo ************************************
echo Add first replica set as a shard
echo ************************************

mongo < addFirstShard.js

sleep 120 | echo Sleeping5 120

echo ************************************
echo Starting second replica Set
echo ************************************

mongo mongo-rs1-1:27017 rs1Setup.js

sleep 120 | echo Sleeping6 120

mongo --host rs1/mongo-rs1-1:27017,mongo-rs1-2:27018,mongo-rs1-2:27019 --eval "db.isMaster()"

echo ************************************
echo Add second replica set as a shard
echo ************************************

mongo < addSecondShard.js

sleep 120 | echo Sleeping7 120


echo ************************************
echo Sharding the DB collection
echo ************************************

mongo < shardCollection.js

sleep 120 | echo Sleeping8 120

echo ************************************
echo Sharding status
echo ************************************

mongo < shardingStatus.js

echo ************************************
echo Done!
echo ************************************



sleep 30000 | echo Sleeping7 30000







