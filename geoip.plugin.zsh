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
		name_ip='网络地址'
		name_location='地理位置'
		name_timezone='所处时区'
		name_isp="服务提供"
	fi
}

print_info(){
	VALUES=($name_ip $name_location $name_timezone $name_isp $name_ip)
	MAX=1
	for i in "${VALUES[@]}"; do
		[ ${#i} -gt ${MAX} ] && MAX=${#i}
	done

	printf "%*s :: %s\n" $MAX $name_ip $IP | tr -d '"'
	printf "%*s :: %s\n" $MAX $name_location $COUNTRY' -> '$REGION' -> '$CITY | tr -d '"'
	printf "%*s :: %s\n" $MAX $name_timezone $TIMEZONE | tr -d '"'
	printf "%*s :: %s\n" $MAX $name_isp $ISP | tr -d '"'

}

alias geoip=get_geo_info