#!/bin/bash

alias python='python3'
alias pip='pip3'


sudo apt-get install tmux tree net-tools -y  -qq
sudo apt-get install  htop -qq

mkdir installs
cd installs
# installing nvtop for nvidia gpu monitoring 
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


# updating repos for ubuntu 
apt-get update

# installing nvidia drivers
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/cuda-ubuntu1804.pin
sudo mv cuda-ubuntu1804.pin /etc/apt/preferences.d/cuda-repository-pin-600
wget http://developer.download.nvidia.com/compute/cuda/10.1/Prod/local_installers/cuda-repo-ubuntu1804-10-1-local-10.1.243-418.87.00_1.0-1_amd64.deb
sudo dpkg -i cuda-repo-ubuntu1804-10-1-local-10.1.243-418.87.00_1.0-1_amd64.deb
sudo apt-key add /var/cuda-repo-10-1-local-10.1.243-418.87.00/7fa2af80.pub
sudo apt-get -qq update
sudo apt-get -y install cuda 


# https://stackoverflow.com/questions/43022843/nvidia-nvml-driver-library-version-mismatch
sudo apt-get --purge remove "*nvidia*" -q
dpkg -l | grep -i nvidia
apt-get update
export LD_PRELOAD=/usr/lib64-nvidia/libnvidia-ml.so
sudo apt install nvidia-driver-418 -q
export LD_PRELOAD=/usr/lib64-nvidia/libnvidia-ml.so



pip install ipykernel

pip install jupyter notebook







