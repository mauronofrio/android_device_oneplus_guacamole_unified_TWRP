#!/sbin/sh
# This script is needed for Hydrogen OS to place reserve.img in the right place.


# Check if already exist the /data/reserve directory symlink and create it
if [ -d /data/reserve ];
then
    echo "/data/reserve already exist"
else
    mkdir /data/reserve
    echo "/data/reserve created"
fi

# Check if already exist the /data/reserve/reserve.img symlink and create it
if [ -f /data/reserve/reserve.img ];
then
    echo "/data/reserve/reserve.img already exist"
else
    touch /data/reserve/reserve.img
    echo "/data/reserve/reserve.img created"
fi

# Check if already exist the /dev/block/bootdevice/by-name/reserve_a symlink and delete it
if [ -L /dev/block/bootdevice/by-name/reserve_a ];
then
    rm -f /dev/block/bootdevice/by-name/reserve_a
    echo "symlink_a exist and removed"
else
    echo "symlink_a doesn't exist"
fi

# Check if already exist the /dev/block/bootdevice/by-name/reserve_b symlink and delete it
if [ -L /dev/block/bootdevice/by-name/reserve_b ];
then
    rm -f /dev/block/bootdevice/by-name/reserve_b
    echo "symlink_b exist and removed"
else
    echo "symlink_b doesn't exist"
fi

# Creating symlinks /dev/block/bootdevice/by-name/reserve_a and /dev/block/bootdevice/by-name/reserve_b
ln -s /data/reserve/reserve.img /dev/block/bootdevice/by-name/reserve_a
ln -s /data/reserve/reserve.img /dev/block/bootdevice/by-name/reserve_b

echo "Patch Reserve script complete."
exit 0
