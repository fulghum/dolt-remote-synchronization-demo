#!/bin/bash

while true; do
    echo "Inserting data..."
    $(mysql --protocol TCP -u root -e "use test; INSERT INTO app_data values (null, now(), 42, 'Auto inserting app data...');")
    sleep 10
done


