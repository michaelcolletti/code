#!/usr/bin/bash
#
#
NUMMB=20000
LVNAME=mysqlloglv
VG=appvg
MOUNT=/db/mysqllogs
FSTYPE=xfs 
FSTAB=/etc/fstab

printf "Creating LV $LVNAME in VG $VG sized at $NUMMB MB \n"


CreateLVFS ()	
	{
sudo lvcreate -L ${NUMMB}M -n $LVNAME $VG
sudo mkfs.xfs -f  /dev/$VG/$LVNAME
	}


echo "Mount with noatime for Maria and perf mounts in fstab noatime "

CreateMount ()
	{
mkdir -p $MOUNT
if [[ $? != '0' ]];then
echo "Mountpoint creation failed \a\a\n"
exit 
fi
	}
CreateFSTabEntry ()
	{
echo "/dev/mapper/${VG}-${LVNAME} $MOUNT $FSTYPE defaults 0 0" >>$FSTAB
#/dev/mapper/appvg- /opt/commvault    defaults 0 0
# /dev/mapper/appvg-marialv /opt/mysql    xfs     defaults        0 0

printf "\n\n\n\a `date` \n"
#tail $FSTAB
mount $MOUNT 
echo "$?"
sleep 10
df -h $MOUNT

	}

	
#################
CreateMount;
CreateLVFS;
CreateFSTabEntry;
