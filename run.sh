#!/bin/sh
rm -rf db || echo 'Creating db/ dir'
ruby --debug test.rb
