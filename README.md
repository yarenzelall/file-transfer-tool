# file-transfer-tool

"ENGLISH"

What does the application do?

Suppose we are going to perform a 10TB log transfer from machine A to machine B, data may be lost during this transfer process, to confirm, it compares the hashes of the files before and after the transfer during the transfer and gives you a warning in case of data loss.

Why should I use the app?

It is difficult to verify data loss manually in the transfer of thousands of large and important files, you can make it easier with this application.

How is the application used?

After the application is run;

Step 1: You need to enter the user name and IP information of the machine you will transfer to. (Example: user@192.168.52.15) Step 2: You need to specify the folder/file path on the machine you are connecting to where you will transfer the file. (Example: /root/stored/2022) Step 3: You need to specify the directory where the transferred file will be transferred. (Example: /root/stored/) Step 4 : You need to specify the directory for the remote.txt file where the hash information of the folder/files we retrieved from the host machine will be written before the transfer. (Example: /root)

In cases where data loss is experienced, the application automatically writes the name and hash of the file with data loss into the 'errors.txt' file, if the file is empty, you have performed a smooth transfer. That's it...

"TURKISH"

Train ne işe yarıyor?

A makinasından B makinasına 10TB'lık log transferi gerçekleştireceğimizi bir senaryoda bu aktarım sürecinde veri kaybı yaşanmaması için ve transferi sağlıklı gerçekleştirmek adına transfer edilen dosyaların hash değerlerini karşılaştırır ve veri kaybı yaşanması durumunda size uyarı verir.

Bu aracı neden kullanmalıyım?

Veri transferi yapılırken transfer aşamasının sağlıklı gerçekleşmesi, veri kaybı yaşanmaması için geliştirilen bir araçtır.

Bu araç nasıl kullanılır?

Araç çalıştırıldıktan sonra;

adım : Transfer gerçekleştireceğiniz makinanın kullanıcı adı ve IP bilgisini girmeniz gerekir. (Örnek : user@192.168.52.15)
adım : Bağlandığınız makinadaki dosya transferi yapacağınız klasor/dosya yolunu belirtmeniz gerekir. (Örnek : /root/stored/2022)
adım : Transfer ettiğiniz dosyanın transfer olacağı dizini belirtmeniz gerekir. (Örnek : /root/stored/)
adım : Karşı makinadan çektiğimiz klasor/dosya'ların transferden önceki hash bilgilerinin yazılacağı remote.txt dosyası için dizin belirtmeniz gerekir. (Örnek : /root)
Veri kaybı yaşanılan durumlarda uygulama otomatik olarak veri kaybı yaşanan dosyanın ismi ve hash'i ile birlikte 'errors.txt' dosyasının içerisine yazar,eğer dosya boş veya oluşturulmamış ise sorunsuz bir transfer gerçekleştirdiniz demektir. İşte bu kadar..
