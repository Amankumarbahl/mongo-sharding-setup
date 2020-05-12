use config
db.settings.save( { _id:"chunksize", value: 1 } )

use admin
sh.enableSharding( "test" )

use test
db.test_collection.createIndex( { number : 1 } )

sh.shardCollection( "test.test_collection", { "number" : 1 } )

