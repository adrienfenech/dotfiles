#This script use bash

echo -n '\033[31m'
find . | sed 's/[^/]*\//|   /g;s/   |*\([^| ]\)/+- - -> \1/'
echo '\033[0m'
