# Yak GitHub Action

An _alpha_ version of a GitHub Action for [Yak] and Yak is still in _beta_.

The action utilizes [a Docker image][dockerhub] offering easy access to a containerized version of the commandline tool `yak` the [Perl based Yak implementation][yak].

## Quick Start

1. Add a `.yaksums.json` file to you directory
1. Specify what files you want Yak to keep an eye on (see the example below)
1. Enable the action (see the example below)

Push some code and observe the Yak action analysing your files

## Example usage

### Checksums file: `.yaksums.json`

```json
{
    "README.md": true,
    "Changelog.md": true,
    "LICENSE": true
}
```

### Workflow: `.github/workflows/yak.yml`

```yaml
on:
  push:
    branches:
      - main
jobs:
  Yak:
    runs-on: ubuntu-latest
    steps:
    -
      name: "Checkout repository"
      uses: actions/checkout@v2
    -
      name: "Analysing repository using yak"
      uses: jonasbn/github-action-yak@main
      with:
        yak-arguments: ''
```

## Inputs

The action is based on a Docker image, which again is a utilization of the `yak` command line tool. The Docker image uses the following two command lines by default:

- `--noconfig`, disables reading of the user specific configuration file, and hence has to rely on the command line arguments
- `--nochecksums`, disables reading of the user specific checksums file, so you have to specify a repository specific checksums file

In addition you can provide any of the below command line argurments.

### `yak-arguments`

The arguments to the `yak` command.

- `--verbose`, enables more verbose output
- `--silent`, disables output and you have to rely on the return value
- `--debug`, enables debug output. can be configured, see: `--config [file]`
- `--nodebug`, disables debug output even if configured or provided as `--debug`, see above
- `--config [file]`, reads alternative configuration file instead of default
- `--color`, enables colorized output, enabled by default or can be configured, see: `--config [file]`
- `--nocolor`, disables colorized output, even if configured or provided as `--color`, see above
- `--emoji`, enables emojis in output, enabled by default or can be configured, see: `--config [file]`
- `--noemoji`, disables emojis in output, even if configured or provided as `--emoji`, see above
- `--about`, emits output on configuration and invocation and terminates with success

For more information please see the [yak documentation][yak] or [Yak specification][Yak]

## Configuration file

If you do not want to work with the command line and want to use a configuration file (which can actually be handled by Yak), specify: `--config [file]` and point to a configuration file in your repository.

### Example

```yaml
on:
  push:
    branches:
      - main
jobs:
  Yak:
    runs-on: ubuntu-latest
    steps:
    -
      name: "Checkout repository"
      uses: actions/checkout@v2
    -
      name: "Analysing repository using yak"
      uses: jonasbn/github-action-yak@main
      with:
        yak-arguments: '--config=.yak.yaml'
```

The configuration can be used to specify the same parameters as available as command line options:

```yaml
verbose: false
debug: false
color: false
emoji: false
yakignores:
- .git
```

For more information and options, please see the [yak documentation][yak] or [Yak specification][Yak]

### Additional Configuration using `.yakignore`

If you want to avoid specifying what directories and paths to ignore in your configuration, you can add `.yakignore` files to your repository structure where needed.

### Example

```.gitignore
.git/
```

For more information and options, please see the [yak documentation][yak] or [Yak specification][Yak]

## Tips

### Getting Your Action Updated Automatically

The _awesome_ tool dependabot lets you scan your used GitHub Marketplace Actions and lets you know if they are in need of an update.

The update is proposed via a pull request, which can be accepted or declined, it will itself take care of deleting pull requests if these become irrelevant.

You specify the configuration in the file: `.github/depedabot.yml` in your repository using this action - actually it scans all your actions.

```yaml
# Basic dependabot.yml file
# REF: https://docs.github.com/en/code-security/supply-chain-security/keeping-your-actions-up-to-date-with-dependabot

version: 2
updates:
  # Enable version updates for Actions
  - package-ecosystem: "github-actions"
    # Look for `.github/workflows` in the `root` directory
    directory: "/"
    # Check for updates once a week
    schedule:
      interval: "weekly"
```

## Resources and References

1. [Yak]
1. [GitHub: perl-app-yak][yak]
1. [DockerHub: Yak][dockerhub]
1. [GitHub Actions][actions]

## License

This project is released under the MIT License, please see LICENSE file for details.

[Yak]: https://jonasbn.github.io/yak
[yak]: https://github.com/jonasbn/perl-app-yak
[dockerhub]: https://hub.docker.com/repository/docker/jonasbn/yak
[actions]: https://docs.github.com/en/free-pro-team@latest/actions
