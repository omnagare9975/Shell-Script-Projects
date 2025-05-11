#!/bin/bash


echo "***************Change the Image Version***************"


if [ $# -lt 2 ]; then
	echo "./filenametoexecute.yml imageversion filename"
	exit 1
fi

sed -i  "s/myapp:[0-9.]\+/myapp:$1/" "$2"


if [ $? -eq 0 ]; then
	echo "image tag changed Successfuly"
else
	echo "Image tag has not changed due to issue"
fi







