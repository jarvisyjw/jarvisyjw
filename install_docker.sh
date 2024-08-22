# Install docker using aliyun's mirror for acceleration in mainland China
 
sudo apt-get remove docker
sudo apt-get remove docker-engine
sudo apt-get remove docker.io

sudo apt-get update
sudo apt-get install \
     apt-transport-https \
     ca-certificates \
     curl \
     gnupg \
     lsb-release

curl -fsSL https://mirrors.aliyun.com/docker-ce/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://mirrors.aliyun.com/docker-ce/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io

sudo systemctl enable docker
sudo systemctl start docker

# post-installation to solve the permission issue

# sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
# reboot ## if does not work 
sudo systemctl restart docker ## or try to just restart the docker