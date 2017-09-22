TERMUX_PKG_HOMEPAGE=http://www.eclipse.org/jdt/core/
TERMUX_PKG_DESCRIPTION="Eclipse Compiler for Java"
TERMUX_PKG_VERSION=4.6.2
TERMUX_PKG_REVISION=1
TERMUX_PKG_SRCURL=http://eclipse.mirror.wearetriple.com/eclipse/downloads/drops4/R-4.6.2-201611241400/ecj-4.6.2.jar
TERMUX_PKG_PLATFORM_INDEPENDENT=true

termux_step_extract_package () {
	mkdir $TERMUX_PKG_SRCDIR
}

termux_step_make () {
	RAW_JAR=$TERMUX_PKG_CACHEDIR/ecj-${TERMUX_PKG_VERSION}.jar
	if [ ! -f $RAW_JAR ]; then
		termux_download $TERMUX_PKG_SRCURL $RAW_JAR \
			9953dc2be829732e1b939106a71de018f660891220dbca559a5c7bff84883e51
	fi

        mkdir -p $TERMUX_PREFIX/share/{dex,java}
	$TERMUX_DX \
		--dex \
		--output=$TERMUX_PREFIX/share/dex/ecj.jar \
		$RAW_JAR

	cd $TERMUX_PKG_TMPDIR
	rm -rf android-jar
	mkdir android-jar
	cd android-jar

        # We need the android classes for JDT to compile against.
	cp $ANDROID_HOME/platforms/android-26/android.jar .
	unzip -q android.jar
	rm -Rf android.jar resources.arsc res assets
	zip -q -r android.jar .

	cp $TERMUX_PKG_TMPDIR/android-jar/android.jar $TERMUX_PREFIX/share/java/android.jar

	# Bundle in an android.jar from an older API also, for those who want to
	# build apps that run on older Android versions.
	rm -Rf ./*
	cp $ANDROID_HOME/platforms/android-16/android.jar android.jar
	unzip -q android.jar
	rm -Rf android.jar resources.arsc res assets
	zip -q -r android-16.jar .
	cp $TERMUX_PKG_TMPDIR/android-jar/android-16.jar $TERMUX_PREFIX/share/java/

	rm -Rf $TERMUX_PREFIX/bin/javac
	install $TERMUX_PKG_BUILDER_DIR/ecj $TERMUX_PREFIX/bin/ecj
	perl -p -i -e "s%\@TERMUX_PREFIX\@%${TERMUX_PREFIX}%g" $TERMUX_PREFIX/bin/ecj
}
