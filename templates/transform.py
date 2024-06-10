import sys

with open(sys.argv[1],'r') as source:
    for line in source:
        row = line.rstrip().split("\t")
        id = row[0]
        new_value = int(row[1]) +100
        print("INSERT INTO outputdata (source_id, data) VALUES (%s,%s);" % (id, new_value))
