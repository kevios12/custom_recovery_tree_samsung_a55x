# OrangeFox 12.1 for Samsung Galaxy A55 5G SM-A556B (a55x)

![Test Image 7](https://gitlab.com/uploads/-/system/group/avatar/2810739/256.png?width=256)

## Flash Steps
Assuming you know the basic of flashing...
* Via ODIN
    * Download `OrangeFox-12.1-A556B.tar` file in the release.
    * In ODIN, in AP section, flash the file you downloaded in release section.
    * Reboot now to Recovery.

* Via FastbootD
    * Download `recovery.cpio.lz4` file in the release.
    * Reboot your device to fastbootd, and in command line, type: `fastboot flash vendor_boot:recovery recovery.cpio.lz4`
    * Run: `fastboot reboot recovery`

## Build Steps
Assuming you know the basic of preparing build environment...
* Prepare and Sync OrangeFox Source:
```
mkdir ~/OrangeFox_sync
cd ~/OrangeFox_sync
git clone https://gitlab.com/OrangeFox/sync.git # (or, using ssh, "git clone git@gitlab.com:OrangeFox/sync.git")
cd ~/OrangeFox_sync/sync/
./orangefox_sync.sh --branch 12.1 --path ~/fox_12.1
```
* goto Directory
```
cd ~/fox_12.1
```
* Device Tree (Make sure you are in root directory of Orangefox Source.):
```
git clone https://github.com/kevios12/custom_recovery_tree_samsung_a55x -b fox12_1 ./device/samsung/a55x
```
* Build (Make sure you are in root directory of OrangeFix source.)
```
source build/envsetup.sh; export ALLOW_MISSING_DEPENDENCIES=true; lunch twrp_a55x-eng; mka vendorbootimage
```
# Done! Check / find `vendor_boot.img or recovery.cpio.lz4` in `out/target/product/a55x/target/product/a55x/´ directory.
