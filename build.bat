@echo off
setlocal
if exist "%JAVA_HOME%\bin\java.exe" goto found
echo You must set JAVA_HOME to the directory containing the JDK
exit /b 1
:found
set JAVA_OPTS=-Xms256m -Xmx1024m
set EPUB_HOME=%~dp0.
set EPUB_VER=31
set EPUB_SPEC=epub%EPUB_VER%

"%JAVA_HOME%\bin\java.exe" %JAVA_OPTS% -classpath "%EPUB_HOME%\lib\ant-launcher.jar" "-Dant.home=%EPUB_HOME%" "-Djavax.xml.parsers.SAXParserFactory=org.apache.xerces.jaxp.SAXParserFactoryImpl" "-Djavax.xml.parsers.DocumentBuilderFactory=org.apache.xerces.jaxp.DocumentBuilderFactoryImpl" "-Dorg.apache.xerces.xni.parser.XMLParserConfiguration=org.apache.xerces.parsers.XIncludeParserConfiguration" org.apache.tools.ant.launch.Launcher -buildfile "%EPUB_HOME%\build.xml" %*

REM mkdir temp\%EPUB_SPEC%
REM "%JAVA_HOME%\bin\java.exe" %JAVA_OPTS% -jar lib/saxon.jar temp/spec/50/epub-spec.xml util/docbook/docbookspec-epub3.xsl user.print.css=epub-print.css html.stylesheet=epub-spec.css base.dir=temp/%EPUB_SPEC%/EPUB/

REM copy build\css\epub-spec.css temp\%EPUB_SPEC%\EPUB\epub-spec.css
REM copy build\css\epub-print.css temp\%EPUB_SPEC%\EPUB\epub-print.css

REM "%JAVA_HOME%\bin\java.exe" %JAVA_OPTS% -jar util/epubcheck/epubcheck.jar -f -mode exp temp/%EPUB_SPEC% -save
REM copy temp\%EPUB_SPEC%.epub build\%EPUB_VER%\spec\%EPUB_SPEC%.epub

REM mkdir temp\spec-multi
REM "%JAVA_HOME%\bin\java.exe" %JAVA_OPTS% -jar lib/saxon.jar temp/spec/50/epub-spec.xml util/docbook/docbookspec-multi.xsl user.print.css=../../../css/epub-print.css html.stylesheet=../../../css/epub-spec.css
REM mkdir build\%EPUB_VER%\spec\spec-multi\
REM xcopy ".\temp\spec-multi" ".\build\31\spec\spec-multi"
