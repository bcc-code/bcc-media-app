SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
for file in $SCRIPT_DIR/ios/*
do
  xcrun simctl push booted tv.brunstad.app "$file"
done