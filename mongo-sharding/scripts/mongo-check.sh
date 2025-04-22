#!/bin/bash
###
# Проверяем кол-во документов в шардах
###

docker-compose exec -T shard1-1 mongosh --port 27018 --quiet <<EOF
use somedb
db.helloDoc.countDocuments()
EOF


docker-compose exec -T shard2-1 mongosh --port 27019 --quiet <<EOF
use somedb
db.helloDoc.countDocuments()
EOF


docker-compose exec -T mongos_router  mongosh --port 27020 --quiet <<EOF
use somedb
db.helloDoc.countDocuments()
EOF