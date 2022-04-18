#!/bin/bash

while true; do
    echo "Synchronizing remotes..."
    $(mysql --protocol TCP -u root -e "CALL SynchronizeWithRemote('origin', 'main');" test)
    sleep 2
done


