# Codacy Credo

Docker engine for running Elixir Credo on Codacy.

## Usage

build the docker image

```
mix codacy.credo.build_docker
```

Regenerate docs

```
mix codacy.credo.generate $version_number
```

## Notes

WILL NOT WORK WITH CUSTOM CHECKS

Elixir & Credo move fairly quickly. In its initial form this repo is only suited for Elixir v1.6.0, Erglange v20

## Requirements (Just for me)

* Generate patterns.json from Credo
* Generate DockerFile
* Run on `/src/` within docker
* Format Credo Output to specified format
* Use .codacy.json on run
