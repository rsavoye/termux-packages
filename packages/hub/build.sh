TERMUX_PKG_HOMEPAGE=https://hub.github.com/
TERMUX_PKG_DESCRIPTION="Command-line wrapper for git that makes you better at GitHub"
TERMUX_PKG_VERSION=2.2.8
TERMUX_PKG_SRCURL=https://github.com/github/hub/archive/v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=5ff475990a5bd335bad8da2d140ea0966c33e6d03dac26bf1558bda94a02b924
TERMUX_PKG_DEPENDS="git"

termux_step_make_install() {
	cd $TERMUX_PKG_SRCDIR

	termux_setup_golang

	./script/build

	cp bin/hub $TERMUX_PREFIX/bin/
	mkdir -p $TERMUX_PREFIX/share/man/man1/
	cp man/hub.1 $TERMUX_PREFIX/share/man/man1/
}
