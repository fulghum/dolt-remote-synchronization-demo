#!/bin/bash

while true; do
    echo "Synchronizing remotes..."
    mysql --protocol TCP -u root -e "CALL SynchronizeWithRemote('origin', 'main');" test
    # Attempt to synchronize every 10 seconds. Change this value to experiment with different sync cycles.
    sleep 10
done


