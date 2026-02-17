# Grub Phase 4
sed 's/--image-base/--nonexist-linker-option/' -i configure

./configure --prefix=/usr          \
            --sysconfdir=/etc      \
            --disable-efiemu       \
            --disable-werror

make

make install

grub-install $LOOP --target i386-pc
