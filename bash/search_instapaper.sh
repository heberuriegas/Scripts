#!/bin/sh

echo "############################################"
echo "# Search from Instapaper article           #"
echo "# Author: Woohoou                          #"
echo "# Date: 08/March/2012                      #"
echo "############################################"
echo ""
echo "Instapaper Username:"
read username
echo "Instapaper Password:"
stty -echo
read password
stty echo
echo "Word to search:"
read search

curl --silent -f --cookie-jar cjar --data "username=$username&password=$password" http://www.instapaper.com/user/login > /dev/null
echo ""
echo "Searching...\n"
c=1
n=2
i=1
while [ $i -ne 0 ]
do
	grep_output="$(curl --silent -f --cookie cjar http://www.instapaper.com/u/$i | grep debug)"
	if curl --silent -f --cookie cjar http://www.instapaper.com/u/$i | grep -i $search>/dev/null; then
		echo 'Found in page '$i':'
		curl --silent -f --cookie cjar http://www.instapaper.com/u/$i | grep -i $search | grep http | awk -F'show_share_panel' '{print $2}' | cut -s -d\( -f2 | awk -F\' '{print "Article: "$6 "\nUrl: "$4"\n"}'
	fi

	i=`expr $i + 1`

	if curl --silent -f --cookie cjar http://www.instapaper.com/u/$i | grep 'No articles saved.'>/dev/null; then
		echo "No more pages."
		i=0
	fi
	sleep 1
done
