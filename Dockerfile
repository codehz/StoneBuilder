FROM archlinux/base
RUN echo '[multilib]' >> /etc/pacman.conf && \
  echo 'Include = /etc/pacman.d/mirrorlist' >> /etc/pacman.conf && \
  pacman -Syyu cmake make git sudo pacman go lib32-glibc lib32-gcc-libs lib32-dbus base-devel vi python docker --noconfirm --needed --noprogressbar && \
  useradd -m abuilder && \
  echo "abuilder ALL = NOPASSWD: ALL" >> /etc/sudoers && \
  sed -i 's,#MAKEFLAGS="-j2",MAKEFLAGS="-j$(nproc)",g' /etc/makepkg.conf && \
  sed -i "s,PKGEXT='.pkg.tar.xz',PKGEXT='.pkg.tar',g" /etc/makepkg.conf && \
  su abuilder -c 'cd; git clone https://aur.archlinux.org/yay.git; cd yay; makepkg' && \
  (cd /home/abuilder/yay; pacman -U *.pkg.tar --noprogressbar --noconfirm) && \
  rm -rf /home/abuilder/yay && \
  su abuilder -c 'cd; yay -Syyu proot-bin --noprogressbar --noconfirm --noeditmenu'

