#!/bin/sh
#
# Back up a MySQL database including triggers and stored procedures

if [ 1 -ne $# ]; then
    echo "Usage: $0 <dbname>"
    exit 1
fi

dbname=$1
date=`date "+%Y-%m-%d"`

# filename=${dbname}_schema_${date}.sql.gz
# echo "Dump schema -> $filename"
# mysqldump -d --quote-names --routines --triggers -p ${dbname} | gzip -c > $filename

filename=${dbname}_${date}.sql.gz
echo "Dump data -> $filename"
mysqldump --quote-names --routines --triggers -p ${dbname} | gzip -c > $filename

exit 0

