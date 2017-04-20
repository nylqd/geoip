get_geo_info(){
	localize

	if [[ $# -eq 0 ]]; then
		while IFS=, read -r COUNTRY REGION CITY TIMEZONE ISP IP;
		do
			print_info
		done <<< $(wget -qO- http://ip-api.com/csv/\?lang\=$lang_local\&fields\=country,regionName,city,timezone,isp,query);
	else
		while IFS=, read -r COUNTRY REGION CITY TIMEZONE ISP IP;
		do
			print_info
		done <<< $(wget -qO- http://ip-api.com/csv/$1\?lang\=$lang_local\&fields\=country,regionName,city,timezone,isp,query);
	fi
}

localize(){
	lang_local='en'
	name_ip='IP Address'
	name_location='Location'
	name_timezone='Timezone'
	name_isp="ISP"
	if locale | grep -q zh_CN; then
		lang_local='zh-CN'
		name_ip='IP地址'
		name_location='位置'
		name_timezone='时区'
		name_isp="运营商"
	fi
}

print_info(){
	echo "$name_ip: $IP" | tr -d '"'
	echo "$name_location: $COUNTRY -> $REGION -> $CITY" | tr -d '"'
	echo "$name_timezone: $TIMEZONE" | tr -d '"'
	echo "$name_isp: $ISP" | tr -d '"'
}

alias geoip=get_geo_info