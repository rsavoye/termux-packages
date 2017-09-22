TERMUX_PKG_DESCRIPTION="Application used in shell scripts which displays text user interface widgets"
TERMUX_PKG_HOMEPAGE=http://invisible-island.net/dialog/
TERMUX_PKG_DEPENDS="ncurses"
TERMUX_PKG_VERSION="1.3-20170509"
TERMUX_PKG_SHA256=2ff1ba74c632b9d13a0d0d2c942295dd4e8909694eeeded7908a467d0bcd4756
TERMUX_PKG_SRCURL=http://invisible-island.net/datafiles/release/dialog.tar.gz
# This will break when a new version is released (the URL unfortunately does not change)
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="--with-ncursesw --enable-widec --with-pkg-config"

termux_step_pre_configure () {
	# Put a temporary link for libtinfo.so
	ln -s -f $TERMUX_PREFIX/lib/libncursesw.so $TERMUX_PREFIX/lib/libtinfo.so
}

termux_step_post_make_install () {
	rm $TERMUX_PREFIX/lib/libtinfo.so
	cd $TERMUX_PREFIX/bin
	ln -f -s dialog whiptail
}
