sudo apt-get update
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update   
sudo apt-get install docker-ce docker-ce-cli containerd.io
sudo docker run hello-world
sudo docker pull hwdsl2/ipsec-vpn-server
echo -e "VPN_IPSEC_PSK=deepdarkfantasy\nVPN_USER=user\nVPN_PASSWORD=qq15139090667" > myvpn.env
docker run --name ipsec-vpn-server --env-file ./myvpn.env --restart=always -p 500:500/udp -p 4500:4500/udp -v /lib/modules:/lib/modules:ro -d --privileged hwdsl2/ipsec-vpn-server
