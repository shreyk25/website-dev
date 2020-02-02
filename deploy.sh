#!/bin/bash
git pull origin master
docker run --rm --volume="$PWD:/srv/jekyll" -it jekyll/jekyll:4.0 jekyll build
cd _site
touch .nojekyll
touch CNAME
echo "theairlab.org" >> CNAME
git add -A
git commit -m "Auto deploy"
git push origin master -f