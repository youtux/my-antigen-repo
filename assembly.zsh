opcode() {
	SOURCE=$(mktemp /tmp/assembly.s) || return 1
	OUT=$(mktemp /tmp/assembly.o.XXXXX)
	echo "$*" > "$SOURCE"
	gcc -c "$SOURCE" -o "$OUT" || return 1
	otool -tvj "$OUT"
	echo "-----------------------------"
	otool -tX "$OUT" | cut -d " " -f 2- | tr -d " "
	rm -f "$SOURCE" "$OUT"
}