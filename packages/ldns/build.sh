TERMUX_PKG_HOMEPAGE=https://www.nlnetlabs.nl/projects/ldns/
TERMUX_PKG_DESCRIPTION="Library for simplifying DNS programming and supporting recent and experimental RFCs"
TERMUX_PKG_DEPENDS="openssl"
TERMUX_PKG_VERSION=1.7.0
TERMUX_PKG_REVISION=3
TERMUX_PKG_SRCURL=https://www.nlnetlabs.nl/downloads/ldns/ldns-${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=c19f5b1b4fb374cfe34f4845ea11b1e0551ddc67803bd6ddd5d2a20f0997a6cc
# --disable-dane-verify needed until openssl 1.1.0:
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="
--with-ssl=$TERMUX_PREFIX
--disable-dane-verify
"
TERMUX_PKG_INCLUDE_IN_DEVPACKAGE="bin/ldns-config share/man/man1/ldns-config.1"

termux_step_post_make_install() {
	# The ldns build doesn't install its pkg-config:
	mkdir -p $TERMUX_PREFIX/lib/pkgconfig
	cp packaging/libldns.pc $TERMUX_PREFIX/lib/pkgconfig/libldns.pc
}
