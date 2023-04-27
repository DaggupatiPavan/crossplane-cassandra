#!/bin/bash
mkfs -t ext4 /dev/sdb
mkdir /cassandra
mount /dev/sdb /cassandra/
cp /etc/fstab /etc/fstab.bak
echo "/dev/sdb       /cassandra   ext4    defaults,nofail        0       0" >> /etc/fstab
mount -a

service cassandra stop
mv /var/lib/cassandra /cassandra
ln -s /cassandra/cassandra /var/lib/cassandra

cp crossplane-cassandra/cassandra.yaml /etc/cassandra/cassandra.yaml
service cassandra start

