FROM archlinux/base
RUN echo '[multilib]' >> /etc/pacman.conf && \
  echo 'Include = /etc/pacman.d/mirrorlist' >> /etc/pacman.conf && \
  pacman -Syyu cmake make git sudo pacman go lib32-glibc lib32-gcc-libs lib32-readline base-devel vi python docker --noconfirm --needed --noprogressbar
