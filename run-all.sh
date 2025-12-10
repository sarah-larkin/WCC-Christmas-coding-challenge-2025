#!/usr/bin/env bash

for file in "./sql"/*.sql; do
    psql -f "${file}" > ${file%.sql}.txt
done

#to run: 
#chmod +x ./run-all.sh
#./run-all.sh