FROM archlinux/base
RUN echo '[multilib]' >> /etc/pacman.conf && \
  echo 'Include = /etc/pacman.d/mirrorlist' >> /etc/pacman.conf && \
  pacman -Sy base-devel cmake make git lib32-glibc lib32-gcc-libs lib32-dbus --noconfirm --needed && \
  git config --global user.email "codehz@outlook.com" && \
  git config --global user.name "CodeHz"