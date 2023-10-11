#! /bin/bash

rm -rf /docs/*
rm -rf /tmp/docs/
git clone https://github.com/drmcrooks/pocketsoc-ng-docs.git /tmp/docs/
mv /tmp/docs/* /docs/
rm -rf /tmp/docs

tail -f /dev/null
