#!/bin/sh

#for mac: export JAVA_HOME=/System/Library/Frameworks/JavaVM.Framework/Versions/CurrentJDK/Home
export ANT_HOME=/lib/
export ANT_OPTS="-Xmx1024m -Xms512m "

test -x "$JAVA_HOME/bin/java" || {
    cat <<EOF 1>&2
You must set JAVA_HOME environment variable to point to
the directory where your JDK is installed.
EOF
    exit 1
}
EPUB_HOME=`dirname $0`
"$JAVA_HOME/bin/java" \
   -Xmx1024m -Xms512m \
  "-Dant.home=$EPUB_HOME" \
  "-Djavax.xml.parsers.SAXParserFactory=org.apache.xerces.jaxp.SAXParserFactoryImpl" \
  "-Djavax.xml.parsers.DocumentBuilderFactory=org.apache.xerces.jaxp.DocumentBuilderFactoryImpl" \
  "-Dorg.apache.xerces.xni.parser.XMLParserConfiguration=org.apache.xerces.parsers.XIncludeParserConfiguration" \
  -cp "$EPUB_HOME/lib/ant-launcher.jar" \
  org.apache.tools.ant.launch.Launcher \
  -buildfile "$EPUB_HOME/build.xml" \
  "$@"
