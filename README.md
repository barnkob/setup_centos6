setup.git
=========
Clone and run this on a new VirtualBox instance running CentOS 6.5 to
configure both the machine and your individual development environment as
follows:

```sh
cd $HOME
sudo yum -y install git
git clone https://github.com/barnkob/setup_centos6.git -b nodejsenv
./setup_centos6/setup.sh   
```

This will clone the nodejsenv branch and set up the box for using nvm and node.




