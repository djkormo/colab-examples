#!/bin/bash

cd /

#mkdir content

cd content/ 

apt-get install nmap net-tools lynx mc htop -y -qqq

apt-get install firefox -y -qqq


apt-get install cmake libncurses5-dev libncursesw5-dev git -y -qqq

git clone https://github.com/Syllo/nvtop.git
mkdir -p nvtop/build && cd nvtop/build
cmake ..

# If it errors with "Could NOT find NVML (missing: NVML_INCLUDE_DIRS)"
# try the following command instead, otherwise skip to the build with make.
cmake .. -DNVML_RETRIEVE_HEADER_ONLINE=True

make
make install # You may need sufficient permission for that (root)
