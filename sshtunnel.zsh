sshtunnel() {
	if [[ $# -eq 0 ]]; then
		echo "Usage: sshtunnel DEST_PORT [DEST_HOSTNAME [SOURCE_PORT] ]"
		return 1
	fi
	# $1 is the DEST port
	# $2 is the DEST hostname
	# $3 is the SOURCE port
	: ${2:=localhost}
	: ${3:=50000}
	echo "Tunnel created on localhost:$3 => $2:$1"
	ssh pi@shikataganai.no-ip.biz -L "$3:$2:$1" -N
}