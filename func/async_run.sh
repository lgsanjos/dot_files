#!/bin/bash
command=$1
temp_filename=$2
end_of_process='xample'
exec 3< <(eval $command)

echo ''
while read line;
do
  echo $line
done <&3

exec 3<&-
