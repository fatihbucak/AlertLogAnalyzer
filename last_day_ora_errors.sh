echo $'show alert -term -p "MESSAGE_TEXT like \'%ORA-%\' and ORIGINATING_TIMESTAMP > \''$(gdate --date="1 day ago" +"%Y-%m-%d %H:%M:00.000000")$'\'"' | adrci > /tmp/fatihloglar.txt
echo "ADR Home = " >> /tmp/fatihloglar.txt

logstr=$(cat /tmp/fatihloglar.txt | grep "ADR Home = ")
logarr=()
while read -r line; do
   logarr+=("$line")
done <<< "$logstr"


len=${#logarr[@]}

for (( i=1; i<$len; i++ ));
do
   dp_report=$(sed -n "/${logarr[i - 1]//\//\\\/}/,/${logarr[i]//\//\\\/}/p" /tmp/fatihloglar.txt | grep "ORA-" | sort | uniq -c | sort -rn -t $'\t' -k5,5)
   if [ ! -z "$dp_report" ]
      then
      echo "${logarr[i - 1]}"
      echo ""
      sed -n "/${logarr[i - 1]//\//\\\/}/,/${logarr[i]//\//\\\/}/p" /tmp/fatihloglar.txt | grep "ORA-" | sort | uniq -c | sort -rn -t $'\t' -k5,5
      echo ""
      echo ""
      echo ""
   fi
done
