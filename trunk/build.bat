@echo off
setlocal
if exist "%JAVA_HOME%\bin\java.exe" goto found
echo You must set JAVA_HOME to the directory containing the JDK
exit /b 1
:found
set ANT_OPTS=-Xms256m -Xmx1024m
set EPUB_HOME=%~dp0.
"%JAVA_HOME%\bin\java.exe" -Xmx1024m -Xms256m -classpath "%EPUB_HOME%\lib\ant-launcher.jar" "-Dant.home=%EPUB_HOME%" "-Djavax.xml.parsers.SAXParserFactory=org.apache.xerces.jaxp.SAXParserFactoryImpl" "-Djavax.xml.parsers.DocumentBuilderFactory=org.apache.xerces.jaxp.DocumentBuilderFactoryImpl" "-Dorg.apache.xerces.xni.parser.XMLParserConfiguration=org.apache.xerces.parsers.XIncludeParserConfiguration" org.apache.tools.ant.launch.Launcher -buildfile "%EPUB_HOME%\build.xml" %*