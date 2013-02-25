#!/usr/bin/env sh

# take my code with you
# and do whatever you want
# but please don’t blame me

check_ffmpeg(){
    if [ -z "`which ffmpeg`" ];
    then
	echo "no ffmpeg installation found" >&2
	exit 1
    fi

    webmencoding=`ffmpeg -formats | grep "WebM file format" | grep E`
    if [ -z "$webmencoding" ];
    then
	echo "no WebM encoding possible" >&2
	exit 1
    fi

    h264encoding=`ffmpeg -formats | grep "h264" | grep E`
    if [ -z "$h264encoding" ];
    then
        echo "no h264 encoding possible" >&2
	exit 1
    fi

    oggencoding=`ffmpeg -formats | grep "ogg" | grep E`
    if [ -z "$oggencoding" ];
    then
        echo "no Ogg encoding possible" >&2
	exit 1
    fi


}

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

check_ffmpeg
