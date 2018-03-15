# Codacy Credo

Docker engine for running Elixir Credo on Codacy.

## Usage

build the docker image

```
MIX_ENV=deploy mix deps.get
MIX_ENV=deploy mix publish
```

Regenerate docs

```
mix codacy.credo.generate $version_number
```

## Notes

WILL NOT WORK WITH CUSTOM CHECKS. Codacy appears to only support predefined checks.

Elixir & Credo move fairly quickly. In its initial form this repo is only suited for Elixir v1.6.0, Erlang v20, Credo v0.8

## Requirements (Just for me)

* Generate patterns.json from Credo
* Generate DockerFile
* Run on `/src/` within docker
* Format Credo Output to specified format
* Use .codacy.json on run
