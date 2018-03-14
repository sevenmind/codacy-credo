FROM library/elixir:alpine

WORKDIR /opt/docker
RUN "ls"

ADD . /opt/docker
RUN mv /opt/docker/docs /docs

# Configure user
RUN adduser -u 2004 -D docker
RUN ["chown", "-R", "docker:docker", "/docs"]
RUN ["chown", "-R", "docker:docker", "."]
USER docker

# ENTRYPOINT ["bin/codacy-engine-rubocop"]
CMD ['sh']
