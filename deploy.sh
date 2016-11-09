cd _site
git add .
git commit -m "site update"
echo "press enter to deploy"
read
git push
cd ..