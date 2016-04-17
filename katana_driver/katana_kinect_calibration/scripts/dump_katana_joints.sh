#!/bin/bash

joints(){
# rostopic echo -n1 /katana_joint_states does the same
tmp=$(mktemp)
rostopic echo /joint_states -n1 | egrep '(name|position)' | cut -d':' -f2 > $tmp

tmp2=$(mktemp)
head -n1 $tmp | sed -e "s: \['::; s:'\]::; s:', ':\n:g" > $tmp2

tmp3=$(mktemp)
tail -n1 $tmp | sed -e "s: \[::; s:\]::; s:, :\n:g" | awk '{ print int($1*100)/100 }' | paste -d' ' $tmp2 - | grep katana | sort > $tmp3

echo -n $(cut -d' ' -f2 $tmp3) | sed -e "s/^\([^ ]*\) \(.*\)$/\2 \1/; s/^\(.*\)$/[\1],/; s/ /, /g"

rm $tmp $tmp2 $tmp3
}

echo "switching motors off!"
sleep 2
rosservice call /switch_motors_off > /dev/null
trap "rosservice call /switch_motors_on > /dev/null; exit" ERR INT

x=""
while [ -z "$x" ]; do
	joints
	read x
done

rosservice call /switch_motors_on > /dev/null
