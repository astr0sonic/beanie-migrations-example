#!/bin/bash

mongosh -u ${MONGO_INITDB_ROOT_USERNAME} -p ${MONGO_INITDB_ROOT_PASSWORD} --eval "
try {
    rs.status();
} catch (err) {
    rs.initiate({
        _id: 'rs0',
        members: [
            {_id: 0, host: 'db:27017'}
        ]
    });
}"
