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
)
#######

WHITE='\033[1;30m'
RED='\033[0;31m'
NC='\033[0m'

echo
echo -e "${WHITE}Checking with git...${NC}"

cd public_html/git/

for d in */ ; do
  if [[ ! ${exclude[*]} =~ "$d" ]]; then
    echo "Updating $d:"
    cd $d && git pull #--quiet
    cd ..
  else
    echo -e "${RED}Skipping${NC} $d"
  fi
done

echo
