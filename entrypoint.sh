#!/bin/bash

set -e 

cp -r /root/guiguider/ .
cp /root/lv_conf.h .

if [ ! -d "ggbuild" ];then
	mkdir ggbuild
else 
	rm -rf ggbuild;
	mkdir ggbuild
fi

cd ggbuild
emcmake cmake ..
emmake make -j4

cp index.html /root
