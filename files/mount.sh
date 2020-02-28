#!/bin/bash
mkfs.xfs /dev/xvdb
#backup fstab
cp /etc/fstab /etc/fstab.bak
echo "/dev/xvdb /Data	xfs	0 0" >> /etc/fstab
