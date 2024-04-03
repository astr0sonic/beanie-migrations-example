# Beanie migrations example

## MongoDB Replica Set using only a single node

`mongod` instance is launched using `--replSet` to specify the replica set name. Then, you need to connect to the primary node and execute the following code:

```javascript
rs.initiate({
    _id: 'REPLICA_SET_NAME',
    members: [
        {_id: 0, host: 'HOST:PORT'}
    ]
})
```

To achieve this, another container (in our case - `init-rs`) is used.

Since we use Docker, we need the key file for MongoDB nodes Key can be generated by:

```bash
openssl rand -base64 756 > mongo.key
```

The key file has to meet the following conditions:

* permission rights - 400;
* owner and owner - mongodb:mongodb.

```bash
chmod 400 mongo.key
chown mongodb:mongodb mongo.key
```
