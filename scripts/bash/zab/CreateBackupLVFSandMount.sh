#!/usr/bin/bash
#
#
NUMGB=99
LVNAME=bigbackuplv
VG=appvg
MOUNT=/zabprod_backup
FSTYPE=xfs 
FSTAB=/etc/fstab

printf "Creating LV $LVNAME in VG $VG sized at $NUMGB MB \n"


CreateLVFS ()	
	{
sudo lvcreate -L ${NUMGB}G -n $LVNAME $VG
sudo mkfs.xfs  /dev/$VG/$LVNAME
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
echo "/dev/mapper/${VG}-${LVNAME} $MOUNT $FSTYPE   defaults 0 0" >>$FSTAB
# /dev/mapper/appvg-marialv /opt/mysql    xfs     defaults        0 0

printf "\n\n\n\a `date` \n"
tail $FSTAB
mount $MOUNT 
echo "$?"
sleep 10
df -h $MOUNT

	}

	
#################
CreateMount;
CreateLVFS;
CreateFSTabEntry;
