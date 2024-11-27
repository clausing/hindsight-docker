# DFIR-Unfurl-docker

Run hindsight cli tool in a docker container from https://github.com/obsidianforensics/hindsight

# Usage

This docker image will run `hindsight.py` against the chromium directory passed as an argument

`docker run -it --rm -v /mnt:/mnt -v ${PWD}:/data clausing/hindsight`
