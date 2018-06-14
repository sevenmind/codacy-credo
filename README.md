# Codacy Credo

[![CircleCI](https://circleci.com/gh/codacy/codacy-credo.svg?style=svg)](https://circleci.com/gh/codacy/codacy-credo)

Tooling & Docker Definition for running [Credo](https://github.com/rrrene/credo) on [Codacy](https://codacy.com)

## Usage

build the docker image

```
./build.sh codacy/codacy-credo latest
```

Run on a project

```
docker run -it -v  $srcDir:/src codacy/codacy-credo
```

Regenerate docs:

```
mix codacy.credo.generate
```

If you want to force a version of Elixir, update it on the .elixir-version file. 
If you want to force a version of Credo, update it on `mix.exs`

## Notes

This has not been tested with custom checks. They probably won't work or will have issues with Codacy.

This project has only been tested with:

* Elixir v1.6.5
* Credo v0.9.3



## Testing

There are two test suites that can be run on this project. The first is Elixir Unit Tests. 


```
mix test
```

The Second test suite is the [Codacy Plugin Test](https://github.com/codacy/codacy-plugins-test) which must be run against the built docker image.


```sh
# In codacy-credo
./build.sh codacy/codacy-credo latest

# in codacy-plugins-test
sbt "run-main codacy.plugins.DockerTest all codacy/codacy-credo:latest"
```

## Docs

[Tool Developer Guide](https://support.codacy.com/hc/en-us/articles/207994725-Tool-Developer-Guide)

[Tool Developer Guide - Using Scala](https://support.codacy.com/hc/en-us/articles/207280379-Tool-Developer-Guide-Using-Scala)

## Test

We use the [codacy-plugins-test](https://github.com/codacy/codacy-plugins-test) to test our external tools integration.
You can follow the instructions there to make sure your tool is working as expected.

## What is Codacy

[Codacy](https://www.codacy.com/) is an Automated Code Review Tool that monitors your technical debt, helps you improve your code quality, teaches best practices to your developers, and helps you save time in Code Reviews.

### Among Codacy’s features

- Identify new Static Analysis issues
- Commit and Pull Request Analysis with GitHub, BitBucket/Stash, GitLab (and also direct git repositories)
- Auto-comments on Commits and Pull Requests
- Integrations with Slack, HipChat, Jira, YouTrack
- Track issues in Code Style, Security, Error Proneness, Performance, Unused Code and other categories

Codacy also helps keep track of Code Coverage, Code Duplication, and Code Complexity.

Codacy supports PHP, Python, Ruby, Java, JavaScript, and Scala, among others.

### Free for Open Source

Codacy is free for Open Source projects.