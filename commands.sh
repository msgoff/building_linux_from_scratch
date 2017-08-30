mkdir /mnt/ramdisk/lfs
export LFS=/mnt/ramdisk/lfs
mkdir -v $LFS/sources

#sticky bit
chmod -v a+wt $LFS/sources

#sources list
wget http://www.linuxfromscratch.org/lfs/view/8.1-rc2/wget-list -o $LFS/wget-list

#get sources
wget --input-file=wget-list --continue --directory-prefix=$LFS/sources

