TERMUX_PKG_HOMEPAGE=http://www.ltrace.org/
TERMUX_PKG_DESCRIPTION="Tracks runtime library calls in dynamically linked programs"
TERMUX_PKG_VERSION=0.7.3.20160411
TERMUX_PKG_REVISION=1
TERMUX_PKG_DEPENDS="elfutils"
local _COMMIT=2def9f1217374cc8371105993003b2c663aefda7
TERMUX_PKG_SRCURL=https://github.com/dkogan/ltrace/archive/${_COMMIT}.zip
TERMUX_PKG_SHA256=d089ae8affd8af782c12aed7ba97f44c7f55b60033ec78ab07e415e7b091a90c
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="
--disable-werror
--without-libunwind
ac_cv_host=$TERMUX_ARCH-generic-linux-gnu
"

termux_step_pre_configure () {
	# rindex is an obsolete version of strrchr which is not available in Android:
	CFLAGS+=" -Drindex=strrchr"

	autoreconf -i ../src
}
