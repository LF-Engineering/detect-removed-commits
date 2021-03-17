# detect-removed-commits
List git commits stored in git objects that are not connected to any revision (squashed commits for example)

- Run `./detect-removed-commits.sh` in git repo path to see cmmits that were removed/squashed etc.

# git version

To use `--unordered` git flag (which makes the command order of magnitude faster), you need to have quite a new git version:

- `sudo add-apt-repository ppa:git-core/ppa -y`.
- `sudo apt-get update`.
- `sudo apt-get install git -y`.
- `git --version`.

