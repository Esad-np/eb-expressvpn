if [[ ! -z $DDNS ]];
then
	checkIP=$(getent hosts $DDNS | awk '{ print $1 }')
else
	checkIP=$IP
fi

if [[ ! -z $checkIP ]];
then
	expressvpnIP=$(curl -H "Authorization: Bearer $BEARER" 'ipinfo.io' | jq --raw-output '.ip')
	if [[ $checkIP = $expressvpnIP ]];
	then
		exit 1
	else
		exit 0
	fi
else
	exit 0
fi