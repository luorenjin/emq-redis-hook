%%--------------------------------------------------------------------
%% Copyright (c) 2013-2018 EMQ Enterprise, Inc. (http://emqtt.io)
%%
%% Licensed under the Apache License, Version 2.0 (the "License");
%% you may not use this file except in compliance with the License.
%% You may obtain a copy of the License at
%%
%%     http://www.apache.org/licenses/LICENSE-2.0
%%
%% Unless required by applicable law or agreed to in writing, software
%% distributed under the License is distributed on an "AS IS" BASIS,
%% WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
%% See the License for the specific language governing permissions and
%% limitations under the License.
%%--------------------------------------------------------------------

-module(emq_redis_hook_cli).

-behaviour(ecpool_worker).

-include("emq_redis_hook.hrl").

-include_lib("emqttd/include/emqttd.hrl").

-define(ENV(Key, Opts), proplists:get_value(Key, Opts)).

-export([connect/1, q/1]).

%%--------------------------------------------------------------------
%% Redis Connect/Query
%%--------------------------------------------------------------------

connect(Opts) ->
    eredis:start_link(?ENV(host, Opts),
                      ?ENV(port, Opts),
                      ?ENV(database, Opts),
                      ?ENV(password, Opts),
                      no_reconnect).

%% Redis Query
-spec(q(string()) -> {ok, undefined | binary() | list()} | {error, atom() | binary()}).
q(Cmd) ->
  ecpool:with_client(?APP, fun(C) -> eredis:q(C, Cmd) end).
