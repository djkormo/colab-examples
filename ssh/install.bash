#!/bin/bash


sudo apt-get install tmux
sudo apt-get install  htop


mkdir installs

cd installs


git clone https://github.com/Syllo/nvtop.git
mkdir -p nvtop/build && cd nvtop/build
cmake ..

# If it errors with "Could NOT find NVML (missing: NVML_INCLUDE_DIRS)"
# try the following command instead, otherwise skip to the build with make.
#cmake .. -DNVML_RETRIEVE_HEADER_ONLINE=True

make
make install # You may need sufficient permission for that (root)

cd ..

export LD_PRELOAD=/usr/lib64-nvidia/libnvidia-ml.so

# installing tensorflow-gpu 2.0

wget https://developer.nvidia.com/compute/cuda/10.0/Prod/local_installers/cuda-repo-ubuntu1604-10-0-local-10.0.130-410.48_1.0-1_amd64 -O cuda-repo-ubuntu1604-10-0-local-10.0.130-410.48_1.0-1_amd64.deb

dpkg -i cuda-repo-ubuntu1604-10-0-local-10.0.130-410.48_1.0-1_amd64.deb

apt-key add /var/cuda-repo-10-0-local-10.0.130-410.48/7fa2af80.pub

apt-get update

apt-get install cuda

pip install tf-nightly-gpu-2.0-preview

