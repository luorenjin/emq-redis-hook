
emq-redis-hook
============

EMQ broker plugin to catch broker hooks through redis hook.<br>
[http://emqtt.io](http://emqtt.io)<br>
[https://www.sakib.ninja](https://www.sakib.ninja)

Setup
-----

##### In Makefile,

DEPS += emq_redis_hook

dep_emq_redis_hook = git https://github.com/luorenjin/emq-redis-hook master

##### In relx.config

{emq_redis_hook, load}

##### emq_web_hook.conf
```
## Redis server address.
##
## Value: Port | IP:Port
##
## Examples: 6379, 127.0.0.1:6379, localhost:6379
redis.hook.server = 127.0.0.1:6379

## Redis pool size.
##
## Value: Number
redis.hook.pool = 8

## Redis database no.
##
## Value: Number
redis.hook.database = 0

## Redis password.
##
## Value: String
## redis.hook.password =

## Redis message key.
##
## Value: String
redis.hook.message.key = message

## The Redis Hook Rules.
redis.hook.rule.client.connected.1     = {"action": "on_client_connected"}
redis.hook.rule.client.disconnected.1  = {"action": "on_client_disconnected"}
redis.hook.rule.client.subscribe.1     = {"action": "on_client_subscribe"}
redis.hook.rule.client.unsubscribe.1   = {"action": "on_client_unsubscribe"}
redis.hook.rule.session.created.1      = {"action": "on_session_created"}
redis.hook.rule.session.subscribed.1   = {"action": "on_session_subscribed"}
redis.hook.rule.session.unsubscribed.1 = {"action": "on_session_unsubscribed"}
redis.hook.rule.session.terminated.1   = {"action": "on_session_terminated"}
redis.hook.rule.message.publish.1      = {"action": "on_message_publish"}
redis.hook.rule.message.delivered.1    = {"action": "on_message_delivered"}
redis.hook.rule.message.acked.1        = {"action": "on_message_acked"}

```

API
----
* client.connected
```json
{
    "action":"client_connected",
    "client_id":"C_1492410235117",
    "username":"C_1492410235117",
    "conn_ack":0
}
```

* client.disconnected
```json
{
    "action":"client_disconnected",
    "client_id":"C_1492410235117",
    "username":"C_1492410235117",
    "reason":"normal"
}
```

* client.subscribe
```json
{
    "action":"client_subscribe",
    "client_id":"C_1492410235117",
    "username":"C_1492410235117",
    "topic":"world",
    "opts":{
        "qos":0
    }
}
```

* client.unsubscribe
```json
{
    "action":"client_unsubscribe",
    "client_id":"C_1492410235117",
    "username":"C_1492410235117",
    "topic":"world"
}
```

* session.created
```json
{
    "action":"session_created",
    "client_id":"C_1492410235117",
    "username":"C_1492410235117"
}
```

* session.subscribed
```json
{
    "action":"session_subscribed",
    "client_id":"C_1492410235117",
    "username":"C_1492410235117",
    "topic":"world",
    "opts":{
        "qos":0
    }
}
```

* session.unsubscribed
```json
{
    "action":"session_unsubscribed",
    "client_id":"C_1492410235117",
    "username":"C_1492410235117",
    "topic":"world"
}
```

* session.terminated
```json
{
    "action":"session_terminated",
    "client_id":"C_1492410235117",
    "username":"C_1492410235117",
    "reason":"normal"
}
```

* message.publish
```json
{
    "action":"message_publish",
    "from_client_id":"C_1492410235117",
    "from_username":"C_1492410235117",
    "topic":"world",
    "qos":0,
    "retain":true,
    "payload":"Hello world!",
    "ts":1492412774
}
```

* message.delivered
```json
{
    "action":"message_delivered",
    "client_id":"C_1492410235117",
    "username":"C_1492410235117",
    "from_client_id":"C_1492410235117",
    "from_username":"C_1492410235117",
    "topic":"world",
    "qos":0,
    "retain":true,
    "payload":"Hello world!",
    "ts":1492412826
}
```

* message.acked
```json
{
    "action":"message_acked",
    "client_id":"C_1492410235117",
    "username":"C_1492410235117",
    "from_client_id":"C_1492410235117",
    "from_username":"C_1492410235117",
    "topic":"world",
    "qos":1,
    "retain":true,
    "payload":"Hello world!",
    "ts":1492412914
}
```

License
-------

Apache License Version 2.0

Author
------

* [Luo Ren Jin](https://github.com/luorenjin)

Contributors
------
* [emqttd](https://github.com/emqttd)
* [turtleDeng](https://github.com/turtleDeng)
* [vishr](https://github.com/vishr)
* [luorenjin](https://github.com/luorenjin)