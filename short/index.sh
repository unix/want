short() {
	url="$1"
	code="$2"
	test -z "$code" && code="$(openssl rand -hex 5 | head -c 5)"
	test -n "$url" && echo "/$code $url" >>_redirects
	out="$(column -s ' ' -t -c 2 <_redirects | sort | uniq)"
	echo "$out" | grep -v "^/\*" >_redirects
	echo >>_redirects
	echo "$out" | grep "^/\*" >>_redirects
}
