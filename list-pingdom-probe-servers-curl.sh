#!/bin/bash
# This script lists the IPs of all Pingdom probe servers.
# Requires curl.

# More info:
# https://support.pingdom.com/Knowledgebase/Article/View/16/0/where-can-i-find-a-list-of-ip-addresses-for-the-pingdom-probe-servers

function check_command {
	type -P $1 &>/dev/null || fail "Unable to find $1, please install it and run this script again."
}

# Check required commands
check_command "curl"

curl -s https://my.pingdom.com/probes/feed | \
grep "pingdom:ip" | \
sed -e 's|</.*||' -e 's|.*>||' | \
sort -n -t . -k 1,1 -k 2,2 -k 3,3 -k 4,4