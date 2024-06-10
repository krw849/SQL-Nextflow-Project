#!/bin/bash

echo "SELECT CONCAT(id, ',', data) FROM sourcedata" | mysql -h 127.0.0.1 -u root -p1234 nf_numbers 2>/dev/null | tail -n +2 > results.txt
