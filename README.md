# Codacy Credo

Docker engine for running Elixir Credo on Codacy.

## Usage

build the docker image

```
docker build . -t credo/codacy
```

Run on a project

```
docker run -it -v  $srcDir:/src credo/codacy
```

Regenerate docs:

```
mix codacy.credo.generate
```

If you want to force a version of Elixir & Credo update the image version in `Dockerfile` and `mix.exs`

## Notes

This has not been tested with custom checks. They probably won't work or will have issues with Codacy.

This project has only been tested with:

* Elixir v1.6
* Erlang v20
* Credo v0.8
