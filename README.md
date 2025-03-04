logseq-static-web
-----------------
This repository contains a static web app version of Logseq that's fully-contained within
the `static` directory.

This allows you to run a local instance of logseq by serving this `static` directory
using the static web server of your choice. This repo uses `python3 -m http.server`.


## Running it
1. `cd static`
2. `./run.sh`
3. go to `localhost:4567`

## Building a new version against the latest logseq source
1. `git submodule update --remote --merge` to update the logseq source
2. `./build.sh`
