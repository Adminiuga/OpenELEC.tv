################################################################################
#      This file is part of OpenELEC - http://www.openelec.tv
#      Copyright (C) 2009-2012 Stephan Raue (stephan@openelec.tv)
#
#  This Program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2, or (at your option)
#  any later version.
#
#  This Program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with OpenELEC.tv; see the file COPYING.  If not, write to
#  the Free Software Foundation, 51 Franklin Street, Suite 500, Boston, MA 02110, USA.
#  http://www.gnu.org/copyleft/gpl.html
################################################################################

PKG_NAME="screen"
PKG_VERSION="4.0.3"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://savannah.gnu.org/projects/screen/"
PKG_URL="http://ftp.gnu.org/gnu/screen/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS="glib"
PKG_BUILD_DEPENDS="toolchain glib"
PKG_PRIORITY="optional"
PKG_SECTION="system"
PKG_SHORTDESC="screen:terminal multiplexer with VT100/ANSI terminal emulation"
PKG_LONGDESC=" GNU Screen is a terminal multiplexer that runs several separate "screens" on a single physical character-based terminal. Each virtual terminal emulates a DEC VT100 plus several ANSI X3.64 and ISO 2022 functions. Screen sessions can be detached and resumed later on a different terminal. Screen also supports a whole slew of other features, including configurable input and output translation, serial port support, configurable logging, and multi-user support."

PKG_IS_ADDON="no"
PKG_AUTORECONF="yes"

PKG_CONFIGURE_OPTS_TARGET="--datadir=/usr/share \
	--with-socket-dir=/var/run/screen \
        --with-pty-mode=0620 \
        --with-pty-group=5 \
        --enable-rxvt_osc \
        --with-sys-screenrc=/etc/screenrc \
	--disable-pam \
        --enable-colors256 \
        --enable-telnet \
        --enable-use-locale"

post_make_target() {
  # dont build parallel
    MAKEFLAGS=-j1
}

post_makeinstall_target() {
	[ -d $INSTALL/etc ] || mkdir $INSTALL/etc
	cp "${ROOT}/${BUILD}/${PKG_NAME}-${PKG_VERSION}/etc/etcscreenrc" $INSTALL/etc/screenrc
}
