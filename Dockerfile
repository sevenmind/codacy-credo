ARG elixir_version
FROM bitwalker/alpine-elixir:${elixir_version} as builder
ENV MIX_ENV=prod
WORKDIR /tmp/build
ADD . /tmp/build
# Build & install deps
RUN mix do local.hex --force, local.rebar --force
RUN mix deps.get
RUN mix deps.compile
RUN mix release

FROM alpine:3.7
RUN apk add --update openssl bash && \
    rm -rf /var/cache/*/*
# Copy Codacy Docs
ADD docs /docs
COPY --from=builder /tmp/build/_build/prod/rel/codacy_credo /opt/app/codacy_credo/
# Configure user
RUN adduser -u 2004 -D docker
RUN ["chown", "-R", "docker:docker", "/docs"]
RUN ["chown", "-R", "docker:docker", "/opt/app"]
USER docker
ENTRYPOINT [ "/opt/app/codacy_credo/bin/codacy_credo", "foreground"]
