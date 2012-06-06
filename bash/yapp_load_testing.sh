#!/bin/sh

echo ""
echo "############################################"
echo "# Load Test in Yapp Project                #"
echo "# Author: Woohoou                          #"
echo "# Date: 05/June/2012                       #"
echo "############################################"
echo ""

main ()
{
NO_ARGS=0
E_OPTERROR=65

if [ $# -eq "$NO_ARGS" ] # should check for no arguments
then
	echo "Usage: `basename $0` <options>"
	echo ""
	echo "Example: `basename $0` -u woohoo -p nusNsc32bJ18f2bX2632bt33f2bq4232bl50f2blPax6 -c 150 -t 20S -f ./urls.txt"
	echo ""
	echo "You must specify interactive, or non interactive mode for now"
	echo "Try './yapp_load_testing.sh -h' for more information."
	echo ""
	exit $E_OPTERROR
fi

while getopts ":u:p:c:t:f:h" Option
do
	case $Option in

		u )
			username=`echo $@|awk '{print $2}'`
		;;

		p )
			password=`echo $@|awk '{print $4}'`
		;;

                c )
                        concurrent=`echo $@|awk '{print $6}'`
                ;;
		t )
			time=`echo $@|awk '{print $8}'`
		;;

		f )
			file=`echo $@|awk '{print $10}'`
		;;

		h )
			#help_func
			echo "Usage: `basename $0` <OPTIONS>"
			echo ""
			echo "Example: `basename $0` -u woohoo -p nusNsc32bJ18f2bX2632bt33f2bq4232bl50f2blPax6 -c 150 -t 20S -f ./urls.txt"
			echo ""
			echo "-u\tUsername"
			echo "-p\tPassword encripted"
			echo "-c\tNumber of concurrencies"
			echo "-t\tTime"
			echo "-f\tPath for file with urls"
			echo ""
			exit $E_OPTERROR
		;;

		* )
			echo "Unimplemented option chosen"
		;;
	esac
done

shift $(($OPTIND - 1))

response="$(curl --silent -f -H 'X-Nokya-Msisd: 528110774622' -F user_name=$username -F password=$password -F action=login http://m.yapp.net/social/services/user.php)"

user_id="$(echo $response | cut -d"\"" -f 4)"
hash_key="$(echo $response | cut -d"\"" -f 8)"

echo Response Server: $response
echo ""

siege -v -i --concurrent=$concurrent --time=$time --file=$file --header="X-Nokia-Msisdn: 5490000000010" --header="USER-ID: $user_id" --header="HASH-KEY: $hash_key" --user-agent="SonyEricssonJ108a/R7DA Profile/MIDP-2.1 Configuration/CLDC-1.1"

echo Response Server: $response
echo ""

}

main "$@"


