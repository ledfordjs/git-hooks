#!/usr/bin/env bash

echo "Running Karma test";

npm run test-bamboo;

if [ $? -ne 0 ]; then
    echo "Karma test failed!";
    exit 1;
fi
