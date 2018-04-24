.PHONY: app tests

PROJECT = emq_redis_hook
PROJECT_DESCRIPTION = Hook with Redis
PROJECT_VERSION = 2.3.6

DEPS = eredis ecpool clique

dep_eredis = git https://github.com/wooga/eredis master
dep_ecpool = git https://github.com/emqtt/ecpool master
dep_clique = git https://github.com/emqtt/clique

BUILD_DEPS = emqttd cuttlefish
dep_emqttd = git https://github.com/emqtt/emqttd master
dep_cuttlefish = git https://github.com/emqtt/cuttlefish

NO_AUTOPATCH = cuttlefish

TEST_DEPS = emqttc emq_auth_username
dep_emqttc = git https://github.com/emqtt/emqttc
dep_emq_auth_username = git https://github.com/emqtt/emq-auth-username

TEST_ERLC_OPTS += +debug_info
TEST_ERLC_OPTS += +'{parse_transform, lager_transform}'

COVER = true

ERLC_OPTS += +debug_info
ERLC_OPTS += +'{parse_transform, lager_transform}'

include erlang.mk

app:: rebar.config

app.config::
	deps/cuttlefish/cuttlefish -l info -e etc/ -c etc/emq_redis_hook.conf -i priv/emq_redis_hook.schema -d data
