FROM elixir:1.12.0-alpine
ARG MIX_ENV=prod
ARG SECRET_KEY_BASE=secret
ENV MIX_HOME=/root/.mix
WORKDIR /app
COPY . /app
RUN apk --no-cache add curl
RUN mix local.hex --force && mix local.rebar --force && mix do deps.get, compile
CMD mix phx.server