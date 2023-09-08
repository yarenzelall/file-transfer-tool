#!/bin/bash

echo  "
	 		   |_  _ || _  
			   | |(/_||(_)
	                 O             	                 ___________
                       . ______          ______________  |         |      _____
                     _()_||__|| ________ |            |  |_________|   __||___||__
                    (         | |      | |            |  |Y_____00_|  |_         _|
                  /-OO----OO**=*OO--OO*=*OO--------OO*=*OO-------OO*=*OO-------OO*=P "
echo
echo " Warning: Please copy the folder/file to be transferred to the directory where you got it.."
echo
echo " Example: If you are going to transfer the directory named /root/test, copy the folder/file to the /root/ directory on your own machine."
echo


echo "You need to enter the user name and IP information of the machine you will transfer to. (Example: user@192.168.52.15): "
read name

echo "You need to specify the folder/file path on the machine you are connecting to where you will transfer the file. (Example: /root/stored/2022): "
read klasor

echo "You need to specify the directory where the transferred file will be transferred. (Example: /root/stored/): "
read hedef

# Karsı sunucudan klasor/dosya cekmek icin.
rsync -avz $name:$klasor $hedef

echo "You need to specify the directory for the remote.txt file where the hash information of the folder/files we retrieved from the host machine will be written before the transfer. (Example: /root): "
read sonuc

# Karsı sunucuda cektıgımız verilerin klasor/dosya hashlerini olusturmak icin.
ssh $name <<EOF
find $klasor -type f -exec md5sum {} + > $sonuc/remotehash.txt
EOF

# Bulundugumuz sunucuya cektigimiz klasor/dosya hashlerini dosyaya yazdırmak icin.
find $klasor -type f -exec md5sum {} + > localhash.txt 

# Karsı sunucuda olusturdugumuz hash degerlerinin yazıldıgı txt dosyasını cekmek icin.
rsync -avz $name:$sonuc/remotehash.txt .

#====================================================================================

for i in $(cat remotehash.txt |cut -d" " -f3);
do

 hasheski=$(cat remotehash.txt | grep $i | cut -d" " -f1)
 hashyeni=$(cat localhash.txt | grep $i | cut -d" " -f1)
 
  if [ "$hasheski" == "$hashyeni" ]; 
 then 
  echo $hasheski" == "$hashyeni $i
 else
  echo $i için Hashler esit degil $hasheski , $hashyeni >> errors.txt
 fi
done

echo 

echo "In cases where data loss is experienced, the application automatically writes the name and hash of the file with data loss into the 'errors.txt' file, if the file is empty, you have performed a smooth transfer. That's it..."
