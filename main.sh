#!/usr/bin/sh

for i in {4..10}
do
    cat en.srt | tr -cs A-Za-z '\n' | tr A-Z a-z | sort |  egrep "^.{$i}$" | uniq -c | sort -rn > $i.txt
    echo "Create file $i.txt"
    sleep 1
done
cat en.srt | tr -cs A-Za-z '\n' | tr A-Z a-z | sort |  egrep '^.{11}' | uniq -c | sort -rn > 11-final-to-end.txt
echo "Create file 11-final-to-end.txt"

for j in {4..10}
do
    cat $j.txt >> 20.txt
    echo "…………………………………" >> 20.txt
    echo "Added $i.txt to 20.txt"
    sleep 1
done
cat 11-final-to-end.txt >> 20.txt
echo "Added 11-final-to-end.txt to 20.txt"
echo "Done"
