#!/usr/bin/env bash

BRANCH_NAME=$(git name-rev --name-only HEAD);
TICKET_NAME=$(cut -d/ -f2 <<< $BRANCH_NAME);
TICKET_NUMBER=$(cut -d- -f1-2 <<< $TICKET_NAME);

echo "commit msg hook was called"

if "$1" | grep -q "$TICKET_NUMBER"; then
    echo "has ticket number";
else
    echo "does not have ticket number";
    exit 1;
fi
