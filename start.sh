#!/bin/bash

# Since we want to mount the volume to develop open-context from the host, we need to clone the oc repository before docker build.
git clone https://github.com/ekansa/open-context-py.git
mv ./open-context-py/ ./open_context/
