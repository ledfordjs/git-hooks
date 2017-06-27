#!/usr/bin/env bash

HOME_PATH=$HOME;

# Import color functions
. $HOME_PATH/git-hooks/color-functions/colors.bash

echo "Running Code Style";

npm run test-code-style-bamboo;

if [ $? -ne 0 ]; then
    red "Failed Code Style!";
    exit 1;
else
    green "Code Style Passed!"
fi
