# update.sh
This script helps automate the process of updating your git repositories that are stored on TAZ. To better understand why I do this, you can read my explanation [here](http://taz.harding.edu/~khuggins/site/git/update-sh/).

This script assumes that your repositories are stored in `~/public_html/git/` and will loop through all the directories stored there and `git pull` for each of them (unless you have them on the exclusion list).

### Installation
`TODO`
