#!/bin/bash
#
# update.sh
# loops through the git directories
# and pulls all new commits. Skips
# directories listed in exclude array:
#######
exclude=(
	"door-prizes/"
  "website/"
  "twister/"
)
#######

GRNBG='\e[1;97;42m'
REDBG='\e[1;97;41m'
NC='\033[0m'

printf "%-20s" "Connecting..."
if ! curl -s --head  --request GET https://github.com | grep "200 OK" > /dev/null; then
  echo -e "${REDBG}[FAIL]${NC}"
  echo "err: remote unreachable"
  exit 1
else
  echo
fi

cd ~/public_html/git/

for d in */ ; do
  if [[ ! ${exclude[*]} =~ "$d" ]]; then
    printf "%-20s" "$d"
    cd $d
    if git pull --quiet; then
			echo -e "${GRNBG} [OK] ${NC}"
    else
      echo -e "${REDBG}[FAIL]${NC}"
    fi
    cd ..
  else
    printf "%-20s" "$d"
    echo -e "${REDBG}[SKIP]${NC}"
  fi
done
