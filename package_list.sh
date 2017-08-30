wget http://www.linuxfromscratch.org/lfs/view/stable/wget-list -O packages_list
while read f; 
	do  
		wget $f;

done < <(cat packages_list)
