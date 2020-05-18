#!/bin/sh
#
# Back up a MySQL database including triggers and stored procedures

USER=
DBNAME=
PASSWD="-p"
OPTIONS=

while getopts d:u:o:p option
do
    case "${option}"
        in
        u) USER="-u "${OPTARG};;
        d) DBNAME=${OPTARG};;
        p) PASSWD="-p";;
	o) OPTIONS="${OPTIONS} ${OPTARG}";;
    esac
done

if [ "" = "$DBNAME" ]; then
    echo "Usage [-u user] [-p] -d database"
    exit 1
fi

date=`date "+%Y-%m-%d"`

filename=${DBNAME}_${date}.sql.gz
echo "Dump data -> $filename"
mysqldump ${OPTIONS} --quote-names --routines --triggers ${USER} ${PASSWD} ${DBNAME} | gzip -c > $filename

exit 0

