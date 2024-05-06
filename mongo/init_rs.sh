#!/bin/bash

until mongosh --host ${MONGO_HOST}:${MONGO_PORT} -u ${MONGO_USERNAME} -p ${MONGO_PASSWORD} > /dev/null 2>&1
do
    echo "Waiting for primary..."
    sleep 1
done
mongosh --host ${MONGO_HOST}:${MONGO_PORT} -u ${MONGO_USERNAME} -p ${MONGO_PASSWORD} --eval "
try {
    rs.status();
} catch (err) {
    rs.initiate({
        _id: '${MONGO_REPLICA_SET}',
        members: [
            {_id: 0, host: '${MONGO_HOST}:${MONGO_PORT}'}
        ]
    });
}"
