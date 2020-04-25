#1515694412
uname -a
#1515694491
uname -r
#1515694509
cat /proc/version
#1515694743
/etc/init.d/mysql status
#1515694754
service mysqld status
#1515694762
sudo service mysqld status
#1515694797
sudo yum install mysql
#1515694821
sudo service mysqld status
#1515694876
rpm -qa | grep mariadb
#1515694882
rpm -qa | grep mysql
#1515694937
sudo service mysql status
#1515694952
sudo service mysql start
#1515694984
systemctl status mariadb.service
#1515694989
sudo systemctl status mariadb.service
#1515695009
sudo systemctl status mariadb
#1515695019
mysql
#1515695055
sudo systemctl status mysql
#1515695480
sudo /etc/init.d/mysql
#1515695609
sudo instal mariadb-server
#1515695622
sudo yum install mariadb-server
#1515695875
sudo systemctl status mysql
#1515695884
sudo systemctl status mariadb
#1515695899
sudo yum install mariadb-client
#1515696000
sudo systemctl start mariadb
#1515696017
sudo systemctl status mariadb
#1515696032
mysql
#1515696168
sudo systemctl enable mariadb
#1515696206
sudo systemctl status mariadb
#1515696760
ls /etc/my.cnf
#1515696770
less /etc/my.cnf
#1515696849
ls $MYSQL_HOME/my.cnf 
#1515696867
ls /etc/mysql/my.cnf
#1515696887
mysql
#1515696955
mysql -u root 
#1515697238
mysqladmin --user=root password "gue55me"
#1515697242
mysql -u root 
#1515697246
mysql -u root -p
#1515697295
mysqladmin --user=root --password "gue55me" password "mrNW7x2mFxy3WmWW7PaukNbLJae"
#1515697329
mysqladmin --user=root --password="gue55me" password "mrNW7x2mFxy3WmWW7PaukNbLJae"
#1515697334
mysql -u root -p
#1515702709
wget https://www.adminer.org/latest.php
#1515702715
ls
#1515702738
mv latest.php sql.php
#1515702741
ls
#1515702749
ls -al
#1515702767
ll
#1515702791
alias
#1515702823
vi .bashrc 
#1515702843
vi .bash_profile 
#1515702865
vi .bashrc 
#1515702889
less /etc/bashrc
#1515702989
ls -al
#1515703001
cat .bash_profile 
#1515703014
cat .bashrc
#1515703032
alias
#1515703044
alias ll='ls-al'
#1515703059
ll
#1515703065
alias ll='ls -al'
#1515703067
ll
#1515703088
vi .bashrc
#1515703105
ll
#1515703107
exti
#1515703112
exit
#1515703119
alias
#1515703139
l.
#1515703150
exit
#1516297192
sudo yum install python
#1516297308
sudo yum update
#1516297376
python -v
#1516297440
sudo yum install yum-utils
#1516297452
sudo yum groupinstall development
#1516297510
sudo yum update
#1516297519
sudo yum upgrade
#1516298128
sudo yum install python3
#1516298165
sudo yum list | grep python
#1516298175
sudo yum list | grep python3
#1516299521
uname -r
#1516299531
cat /etc/release
#1516299542
cat /etc/*-release
#1516299638
sudo yum install https://rhel7.iuscommunity.org/ius-release.rpm
#1516299669
sudo yum install python36u
#1516299718
python3.6 -V
#1516299733
python -v
#1516299761
sudo yum install python36u-pip
#1516299792
sudo yum install python36u-devel
#1516299819
python –V
#1516299825
python –v
#1516299833
python -V
#1516299838
python -v
#1516299844
python -V
#1516299854
python3.6 -V
#1516299997
ls /
#1516300001
ll /
#1516300148
pwd
#1516300175
ll /usr
#1516300190
ll /var
#1516300263
python3 -V
#1516300267
python3.6 -V
#1516300328
python3.6 -m venv /var/python3.6
#1516300336
sudo python3.6 -m venv /var/python3.6
#1516300363
ll /var
#1516300371
ll /var/python3.6/
#1516300378
sudo ll /var/python3.6/
#1516300388
sudo ls -al /var/python3.6/
#1516300567
sudo vi /var/python3.6/pyvenv.cfg
#1516300580
sudo ls -al /var/python3.6/
#1516300591
cd /var/python3.6/
#1516300596
sudo cd /var/python3.6/b
#1516300644
venv
#1516300810
sudo ls -al bin
#1516300816
pwd
#1516300822
sudo cd /var/python3.6/
#1516300830
pwd
#1516300834
sudo pwd
#1516300866
sudo ls -al /var/python3.6/bin
#1516300923
sudo . /var/python3.6/bin/activate
#1516301033
sudo groupadd scripts
#1516301051
sudo adduser sbjarna scripts
#1516301111
id
#1516301162
sudo adduser sbjarna scripts
#1516301188
sudo usermod -G scripts sbjarna
#1516301191
id
#1516301263
groups
#1516301317
members
#1516301334
less /etc/group
#1516301435
sudo chown root:scripts /var/python3.6/
#1516301459
ls /var
#1516301464
ll /var
#1516301487
ll /var/python3.6/
#1516301500
sudo chown -r root:scripts /var/python3.6/
#1516301509
chown --help
#1516301518
sudo chown -R root:scripts /var/python3.6/
#1516301523
ll /var/python3.6/
#1516301540
ll /var
#1516301581
chmod 770 /var/python3.6/
#1516301586
sudo chmod 770 /var/python3.6/
#1516301591
ll /var/python3.6/
#1516301594
ll /var/
#1516301794
id
#1516301831
sudo usermod -G root sbjarna
#1516301833
id
#1516301860
sudo usermod -g root sbjarna
#1516301911
sudo chown -R sbjarna:root /var/python3.6/
#1516301921
ll /var/python3.6/
#1516302662
cd /var/python3.6/
#1516302665
ll
#1516302694
. bin/activate
#1516302727
pip install requests
#1516302744
pip install xmltodict
#1516302800
python -V
#1516305569
ps -aux
#1516305577
ps -aux | i python
#1516305672
ps -aux | grep python
#1516303469
cd /var/python3.6/
#1516303479
. bin/activate
#1516303716
ll
#1516303742
python QualysHostDetection.py
#1516303755
pip install pymysql
#1516303759
python QualysHostDetection.py
#1516303919
vi QualysHostDetection.py 
#1516303979
python QualysHostDetection.py
#1516310966
ps -aux | grep python
#1516311247
cd /var/python3.6/
#1516311255
. bin/activate
#1516311275
python QualysHostDetection.py 
#1516311472
vi QualysHostDetection.py 
#1516311510
python QualysHostDetection.py 
#1516325694
cd /var/python3.6/
#1516325705
ll
#1516325716
. bin/activate
#1516325730
python QualysHostDetection.py 
#1516325742
python QualysHostDetection.py &
#1516325752
ll
#1516325766
tail -f QualysHostDetect.log 
#1516326106
time
#1516326111
date
#1516326129
tail -f QualysHostDetect.log 
#1516326158
ps -aux | grep python
#1516326173
tail QualysHostDetect.log 
#1516326197
tail 50 QualysHostDetect.log 
#1516326208
tail -?
#1516326212
tail --?
#1516326229
tail --help
#1516326250
tail -n 50 QualysHostDetect.log 
#1516326258
tail -f QualysHostDetect.log 
#1516332104
cd /var/python3.6/
#1516332115
tail -f QualysHostDetect.log 
#1516332141
ps -aux | grep python
#1516332155
date
#1516332328
. /bin/activate
#1516332331
pwd
#1516332334
ll
#1516332344
. bin/activate
#1516332365
vi QualysHostDetection.py 
#1516332465
python QualysHostDetection.py </dev/null > pythonscript.out 2>&1 &
#1516332476
ps -aux | grep python
#1516332484
tail -f QualysHostDetect.log 
#1516332609
ps -aux | grep python
#1516332619
disown
#1516332622
ps -aux | grep python
#1516332636
fg
#1516332641
ps -aux | grep python
#1516332663
man nohup
#1516332761
man tmux
#1516332767
tmux
#1516332771
man screen
#1516332815
ps -aux | grep python
#1516332823
tail -f QualysHostDetect.log 
#1516332913
ps -aux | grep python
#1516332934
tail -f /var/python3.6/QualysHostDetect.log 
#1516332950
ps -aux | grep python
#1516332957
date
#1516332969
tail -f /var/python3.6/QualysHostDetect.log 
#1516333275
grep https /var/python3.6/QualysHostDetect.log 
#1516333315
grep URL /var/python3.6/QualysHostDetect.log 
#1516333404
tail -f /var/python3.6/QualysHostDetect.log 
#1516340207
ps -aux | python
#1516340214
ps -aux | grep python
#1516340232
tail -f /var/python3.6/QualysHostDetect.log 
#1516381852
ll /var/python3.6/
#1516389681
cd /var/python3.6/
#1516389688
. bin/activate
#1516389703
ll
#1516389732
vi ImportCSV.py 
#1516389811
python ImportCSV.py 
#1516389866
vi ImportCSV.py 
#1516389903
python ImportCSV.py 
#1516394789
sudo yum install apache2
#1516394806
sudo yum install apache
#1516394878
sudo yum install httpd
#1516394900
sudo systemctl enable httpd.service
#1516394917
sudo systemctl start httpd.service
#1516394979
systemctl is-active httpd.service
#1516394998
sudo systemctl is-active httpd.service
#1516395025
sudo apachectl configtest
#1516395121
sudo yum install php php-mysql php-gd php-pear
#1516395138
sudo systemctl restart httpd.service
#1516395171
sudo vi /var/www/html/test.php
#1516395321
ll /var/log/
#1516395345
ll /var/log/httpd/
#1516395357
sudo ls -al /var/log/httpd/
#1516395394
sudo less /var/log/httpd/error_log
#1516395433
ll /var/www/html
#1516395473
sudo chmod 777 /var/www/html/test.php 
#1516395653
ll /var/www/
#1516395673
sudo chmod 770 /var/www/html/test.php 
#1516395699
ps -aux | grep http
#1516395755
sudo chown apache:root //var/www/html/test.php 
#1516395759
ll /var/www/
#1516395764
ll /var/www/html/
#1516395791
sudo chmod 550 /var/www/html/test.php 
#1516395794
ll /var/www/html/
#1516395823
sudo chmod 540 /var/www/html/test.php 
#1516395838
ll /var/www/html/
#1516395926
ll
#1516395951
sudo mv sql.php /var/www/html
#1516395957
ll /var/www/html/
#1516395985
sudo chmod 540 /var/www/html/sql.php 
#1516395994
sudo chown apache:root //var/www/html/sql.php 
#1516395998
ll /var/www/html/
#1516396031
sudo chmod 440 /var/www/html/sql.php 
#1516396033
ll /var/www/html/
#1516396058
sudo chmod 440 /var/www/html/test.php 
#1516396141
wget https://www.adminer.org/latest.php
#1516396146
ll
#1516396173
sudo mv latest.php /var/www/html/sql.php
#1516396184
ll /var/www/html/
#1516396195
sudo chmod 440 /var/www/html/sql.php 
#1516396202
sudo chown apache:root //var/www/html/sql.php 
#1516573440
cd /var/python3.6/
#1516573445
. bin/activate
#1516573466
python QualysVulnDetail.py 
#1516575501
disown
#1516575518
ps -aux | grep python
#1516575531
ll
#1516575542
tail -f QualysVuln
#1516575545
tail -f QualysVuln.log 
#1516575738
ll
#1516575741
ps -aux | grep python
#1516575778
tail -f QualysVuln.log 
#1516576083
ps -aux | grep python
#1516576095
kill 13059
#1516576097
ps -aux | grep python
#1516576106
kill -9 13059
#1516576109
ps -aux | grep python
#1516576130
nohup python QualysVulnDetail.py &
#1516576142
ps -aux | grep python
#1516576153
tail -f QualysVuln.log 
#1516578401
ps -aux | grep python
#1516578436
ll
#1516578446
tail nohup.out
#1516578576
nohup python QualysVulnDetail.py &
#1516578583
ps -aux | grep python
#1516578594
tail nohup.out
#1516578605
tail QualysVuln.log 
#1516578649
ps -aux | grep python
#1516578666
tail nohup.out
#1516578687
tail -f QualysVuln.log 
#1516578801
tail nohup.out
#1516579166
tail -f /var/python3.6/QualysVuln.log 
#1516596526
tail nohup.out
#1516596544
tail /var/python3.6/nohup.out 
#1516596794
cd /var/python3.6/
#1516596799
. bin/activate
#1516596816
nohup python QualysVulnDetail.py &
#1516596844
tail -f /var/python3.6/QualysVuln.log 
#1516597353
ps -aux | grep python
#1516597359
ll
#1516597380
tail nohup.out 
#1516597393
tail -f nohup.out 
#1516597438
tail nohup.out 
#1516597462
ps -aux | grep python
#1516597469
ll
#1516597498
tail -f /var/python3.6/QualysVuln.log 
