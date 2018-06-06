FROM bitwalker/alpine-elixir:1.6.5

ENV MIX_ENV=prod

# Copy Codacy Docs
ADD docs /docs

WORKDIR /tmp/build
ADD . /tmp/build

# Build & install deps
RUN mix do local.hex --force, local.rebar --force,
RUN mix deps.get
RUN mix deps.compile
RUN mix release

# Copy build product to runtime
RUN  cp -r /tmp/build/_build/prod/rel/codacy_credo/ /opt/app/codacy_credo/

# Cleanup build source
RUN rm -rf /tmp/build

# Configure user
RUN adduser -u 2004 -D docker
RUN ["chown", "-R", "docker:docker", "/docs"]
RUN ["chown", "-R", "docker:docker", "/opt/app"]
USER docker

ENTRYPOINT [ "/opt/app/codacy_credo/bin/codacy_credo", "foreground"]
