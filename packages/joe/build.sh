TERMUX_PKG_HOMEPAGE=http://joe-editor.sourceforge.net
TERMUX_PKG_DESCRIPTION="Wordstar like text editor"
TERMUX_PKG_DEPENDS="ncurses, libutil"
TERMUX_PKG_CONFLICTS="jupp"
TERMUX_PKG_VERSION=4.4
TERMUX_PKG_SRCURL=https://sourceforge.net/projects/joe-editor/files/JOE%20sources/joe-${TERMUX_PKG_VERSION}/joe-${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=a5704828bbca29acb9e200414fef522c66cdf9ce28150f402d6767da43460979
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="--disable-termcap"
