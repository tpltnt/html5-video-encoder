#!/usr/bin/env sh

# take my code with you
# and do whatever you want
# but please don’t blame me

# sanity checks
if [ ! -e $1 ];
then
    echo "given file does not exists" >&2
fi

if [ ! -r $1 ];
then
    echo "no read permission for given file" >&2
fi

if [ ! -f $1 ];
then
    echo "given file is not a regular file" >&2
fi

if [ ! -s $1 ];
then
    echo "given file is of size zero" >&2
fi

