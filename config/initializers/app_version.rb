module AppVersion
  LATEST_TAG = `VERSION=$(git describe --tags 2> /dev/null); if [ $VERSION ]; then echo $VERSION; else echo 'unknown'; fi`.chomp
end
