#!/bin/bash

export DEBIAN_FRONTEND=noninteractive
apt-get -yq update
apt-get -yq upgrade
apt-get -yq install dnsutils 
apt-get clean


cat <<EOF > initscript_result.txt
The initscript is working !
EOF