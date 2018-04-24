PROJECT = emq_redis_hook
PROJECT_DESCRIPTION = EMQ Redishook Plugin
PROJECT_VERSION = 2.3.7

DEPS = jsx clique
dep_jsx    = git https://github.com/talentdeficit/jsx
dep_clique = git https://github.com/emqtt/clique

BUILD_DEPS = emqttd
dep_emqttd = git https://github.com/emqtt/emqttd master

ERLC_OPTS += +debug_info
ERLC_OPTS += +'{parse_transform, lager_transform}'

TEST_DEPS = emqttc
dep_emqttc = git https://github.com/emqtt/emqttc

TEST_ERLC_OPTS += +debug_info
TEST_ERLC_OPTS += +'{parse_transform, lager_transform}'

COVER = true

include erlang.mk

app:: rebar.config

app.config::
	./deps/cuttlefish/cuttlefish -l info -e etc/ -c etc/emq_redis_hook.conf -i priv/emq_redis_hook.schema -d data