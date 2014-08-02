MODULES[0]='willdurand-nodejs';
MODULES[1]='puppetlabs-mongodb';
MODULES[2]='fsalum-redis';
export LC_ALL="en_US.UTF-8";
#Installing required modules by puppet module to keep up with versions
for i in "${MODULES[@]}"
do
	:
	(puppet module list --modulepath '/vagrant/puppet/modules' | grep $i ) || (puppet module install $i --modulepath '/vagrant/puppet/modules')
done