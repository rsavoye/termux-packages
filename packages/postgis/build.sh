TERMUX_PKG_HOMEPAGE=https://postgis.net/source/
TERMUX_PKG_DESCRIPTION="PostGIS Extension"
TERMUX_PKG_SRCURL=http://download.osgeo.org/postgis/source/postgis-2.3.3.tar.gz
TERMUX_PKG_VERSION=2.3.3
TERMUX_PKG_BUILD_IN_SRC="yes"
TERMUX_PKG_EXTRA_CONFIGURE_ARGS+=" --host=aarch64-unknown-linux-gnu"
CC=gcc
CXX=g++
