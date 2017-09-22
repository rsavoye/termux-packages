TERMUX_PKG_HOMEPAGE=https://www.gnu.org/software/xorriso
TERMUX_PKG_DESCRIPTION="Tool for creating ISO files."
TERMUX_PKG_VERSION=1.4.8
TERMUX_PKG_REVISION=0
TERMUX_PKG_SRCURL=https://www.gnu.org/software/xorriso/xorriso-${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=ec82069e04096cd9c18be9b12b87b750ade0b5e37508978feabcde36b2278481
TERMUX_PKG_DEPENDS="iconv, libandroid-support, readline, libbz2"
TERMUX_PKG_BUILD_IN_SRC=yes
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="--disable-jtethreads"

termux_step_pre_configure() {
        LDFLAGS+=" -landroid-support"
}
