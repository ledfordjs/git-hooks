#!/usr/bin/env bash

echo "Running pre-commit hook"
MESSAGE=$(git log -1 HEAD --pretty=format:%s)
echo $MESSAGE;
HOME_PATH=$HOME

bash $HOME_PATH/git-hooks/run-jshint.bash;

if [ $? -ne 0 ]; then
    echo "Code was not commited";
    exit 1;
fi

bash $HOME_PATH/git-hooks/run-code-style.bash;

if [ $? -ne 0 ]; then
    echo "Code was not commited";
    exit 1;
fi

bash $HOME_PATH/git-hooks/run-test.bash;

if [ $? -ne 0 ]; then
    echo "Code was not commited";
    exit 1;
else
    echo "All test passed ready to commit"
fi
