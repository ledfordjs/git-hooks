#!/usr/bin/env bash

GIT_DIR=$(git rev-parse --git-dir);
HOME_PATH=$HOME;

GIT_HOOKS=($(find $HOME_PATH/git-hooks/hooks -type f));

echo "Installing hooks...";

for i in "${GIT_HOOKS[@]}"; do
    HOOK_PATH=$i;
    HOOK_BASH_FILE=${HOOK_PATH##*/};
    HOOK_NAME=${HOOK_BASH_FILE%.*};

    ln -s ${HOOK_PATH} $GIT_DIR/hooks/${HOOK_NAME}

    echo "installed ${HOOK_NAME}";
done

echo "Done";
