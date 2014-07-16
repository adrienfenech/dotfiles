#!/bin/sh

name="toto"
echo $name
name=`echo $name | head -c1 | tr 'a-z' 'A-Z'``echo $name | tail -c +2`
echo $name
