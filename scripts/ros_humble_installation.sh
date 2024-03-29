#!/bin/bash

#First ensure that the Ubuntu Universe repository is enabled.

sudo apt install software-properties-common
sudo add-apt-repository universe

#Now add the ROS 2 GPG key with apt.

sudo apt update && sudo apt install curl -y
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg

#Then add the repository to your sources list.

echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null

#Update your apt repository caches after setting up the repositories.

sudo apt update
sudo apt upgrade

#Desktop Install (Recommended): ROS, RViz, demos, tutorials.

sudo apt install ros-humble-desktop

#Set up your environment by sourcing the following file.

echo "alias humble='source /opt/ros/humble/setup.bash'" >> ~/.bashrc
