mkdir /mnt/ramdisk/lfs
export LFS=/mnt/ramdisk/lfs
mkdir -v $LFS/sources

#sticky bit
chmod -v a+wt $LFS/sources

#sources list
wget http://www.linuxfromscratch.org/lfs/view/8.1-rc2/wget-list -o $LFS/wget-list

#get sources
wget --input-file=wget-list --continue --directory-prefix=$LFS/sources

#md5sums
wget http://www.linuxfromscratch.org/lfs/view/8.1-rc2/md5sums -o $LFS/sources/md5sums


mkdir -v $LFS/tools
ln -sv $LFS/tools /

#fix
sudo groupadd lfs
useradd -s /bin/bash -g lfs -m -k /dev/null lfs
adduser --ingroup lfs lfs


cat > ~/.bash_profile << "EOF"
exec env -i HOME=$HOME TERM=$TERM PS1='\u:\w\$ ' /bin/bash
EOF


cat > ~/.bashrc << "EOF"
set +h
umask 022
LFS=/mnt/ramdisk/lfs
LC_ALL=POSIX
LFS_TGT=$(uname -m)-lfs-linux-gnu
PATH=/tools/bin:/bin:/usr/bin
export LFS LC_ALL LFS_TGT PATH
EOF
