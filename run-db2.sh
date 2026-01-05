#!/usr/bin/env bash

for file in "./db2"/*.sql; do
    psql -f "${file}" > ${file%.sql}.txt
done

#to run: 
#chmod +x ./run-db2.sh
#./run-db2.sh 