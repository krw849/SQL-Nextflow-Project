#!/bin/bash

echo "INSERT INTO outputdata (source_id, data) VALUES ($1,$2)" | mysql -h 127.0.0.1 -u root -p1234 nf_numbers
