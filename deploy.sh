cd $(cd $(dirname $0); pwd)/_site
git reset --hard
git pull

cd ..
git reset --hard
git pull

jekyll build
cd _site
git add .
git commit -m "site update"
find $(pwd) -type f -name "*.html" -print | xargs -0 dotnet ../AmpImgnizer/AmpImgnizer.dll
git add .
git commit -m "replace img to amp-img"
git push