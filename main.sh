#!/usr/bin/sh

for i in {4..10}
do
    cat en.srt | tr -cs A-Za-z '\n' | tr A-Z a-z | sort |  egrep "^.{$i}$" | uniq -c | sort -rn > $i.txt
    echo "Create file $i.txt"
    sleep 1
done
cat en.srt | tr -cs A-Za-z '\n' | tr A-Z a-z | sort |  egrep '^.{11}' | uniq -c | sort -rn > 11-final-to-end.txt
echo "Create file 11-final-to-end.txt"
