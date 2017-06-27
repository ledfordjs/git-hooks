#!/usr/bin/env bash

npm run jshint-bamboo;

if [ $? -ne 0 ]; then
    echo "Failed jshint please run 'npm run jshint' for list of errors";
    exit 1;
fi
