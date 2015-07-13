#!/bin/bash

# tests that when apache2 packages are not present on #
# the system that they are i nstalled by puppet       #
#                                                     #

sudo apt-get -qq purge apache2*

test1=""
test2=""
apache=$(dpkg -l | grep apache)
if [[ -z "$apache" ]]; then
        test1="[ X ] Apache removed."
else
        test1="[ ! ] Apache should have been removed."
fi

sudo puppet agent -t

apache=$(dpkg -l | grep apache)

if [ -z "$apache" ]; then
        test2="[ ! ] Apache is missing after puppet sync"
else
        test2="[ X ] Apache successfully installed by puppet."
fi

printf "%s\n" "$test1"
printf "%s\n" "$test2"