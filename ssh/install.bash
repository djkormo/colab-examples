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



#+-----------------------------------------------------------------------------+
#| NVIDIA-SMI 430.40       Driver Version: 418.67       CUDA Version: 10.1     |
#|-------------------------------+----------------------+----------------------+
#| GPU  Name        Persistence-M| Bus-Id        Disp.A | Volatile Uncorr. ECC |
#| Fan  Temp  Perf  Pwr:Usage/Cap|         Memory-Usage | GPU-Util  Compute M. |
#|===============================+======================+======================|
#|   0  Tesla K80           Off  | 00000000:00:04.0 Off |                    0 |
#| N/A   47C    P8    31W / 149W |      0MiB / 11441MiB |      0%      Default |
#+-------------------------------+----------------------+----------------------+
#
#+-----------------------------------------------------------------------------+
#| Processes:                                                       GPU Memory |
#|  GPU       PID   Type   Process name                             Usage      |
#|=============================================================================|
#|  No running processes found                                                 |
#+-----------------------------------------------------------------------------+



dpkg -l | grep -i nvidia

apt-get remove --purge nvidia-driver-430

apt-get remove --purge nvidia*
apt-get remove --purge libnvidia*
apt-get update 

apt-get install libnvidia-common-418 libnvidia-decode-418  libnvidia-encode-418  libnvidia-cfg1-418
apt-get install libnvidia-common-418  libnvidia-fbc1-418   libnvidia-gl-418  libnvidia-ifr1-418
apt-get install nvidia-kernel-common-418  nvidia-kernel-source-418 xserver-xorg-video-nvidia-418 
apt-get install nvidia-driver-418 

