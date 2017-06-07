#!/bin/bash

ln -sf /usr/share/zoneinfo/America/Chicago /etc/localtime
hwclock --systohc
echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf
echo trump > /etc/hostname
echo "#<ip-address>	<hostname.domain.org>	<hostname>" >> /etc/hosts
echo "127.0.0.1	localhost.localdomain	localhost" /etc/hosts
echo "::1		localhost.localdomain	localhost" /etc/hosts
echo "127.0.0.1	trump.localdomain	trump" /etc/hosts

passwd

#I'm out...



