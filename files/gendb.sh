#/bin/sh
find . -mindepth 2 -type f -not -name "*.txt" -not -name "*.sig" -not -name "*.patch" -type f -print0 | xargs -0 sha256sum | sort | uniq -w 64 | awk -F '' '{ printf "    "; for(i=1; i<=64; i+=2) {printf "0x%s%s, ", $i,$(i+1);}} {print "// " substr($0,69)}'
