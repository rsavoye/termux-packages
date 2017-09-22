# Status: Needs a working resolv.h.
#         Perhaps add libres?
#         http://dan.drown.org/android/src/libres/
TERMUX_PKG_HOMEPAGE=https://github.com/traviscross/mtr
TERMUX_PKG_DESCRIPTION="Network diagnostic tool"
TERMUX_PKG_VERSION=0.92
TERMUX_PKG_SHA256=568a52911a8933496e60c88ac6fea12379469d7943feb9223f4337903e4bc164
TERMUX_PKG_SRCURL=https://github.com/traviscross/mtr/archive/v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_DEPENDS="ncurses"
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="--without-gtk --disable-ipv6"

termux_step_pre_configure() {
	cd $TERMUX_PKG_SRCDIR
	./bootstrap.sh
}
