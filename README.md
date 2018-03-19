# Codacy Credo

Tooling & Docker Definition for running [Credo](https://github.com/rrrene/credo) on [Codacy](https://codacy.com)

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


## Known issues
 
A number checks aren't working correctly:
 
 * consistency_line_endings
 * readability_large_numbers
 * readability_max_line_length
 * readability_parentheses_on_zero_arity_defs
 * readability_prefer_implicit_try
 * readability_redundant_blank_lines
 * readability_string_sigils
 * readability_trailing_blank_line
 * readability_trailing_white_space
 * refactor_append_single_item
 * refactor_double_boolean_negation


## Testing

This tool us partially tested. Any efforts to refactor or improve coverage are greatly appreciated. 

There are two test suites that can be run on this project. The first is Elixir Unit Tests. 


```
mix test
```

The Second test suite is the [Codacy Plugin Test](https://github.com/codacy/codacy-plugins-test) which must be run against the built docker image.


```sh
# In codacy-credo
docker build . -t codacy/credo:latest

# in codacy-plugins-test
sbt "run-main codacy.plugins.DockerTest all codacy/credo:latest"
```