# Introduction #

This document outlines how to get hooked up to the SVN and get access to the latest development version of the schemas, spec et al.


## SVN Client ##
Install an SVN client suitable for your platform.

(Windows users: a popular windows SVN Client is TortoiseSVN, available at http://tortoisesvn.tigris.org/. For more options, see http://subversion.tigris.org/links.html#clients)

## Check out ##
Using your SVN client, check out (create a local copy of) the code using the protocol provided in the Command-Line Access section of http://code.google.com/p/epub-revision/source/checkout

What you get is read-only ("anonymous") access. If you are a committer as well, you need a google account and you need one of this projects admins to grant you write rights.

## Run the build script ##
The build process uses Apache Ant. You need to have Java5 or later installed in order to build. Your JAVA\_HOME system variable [must be set to the location of the JDK](http://www.sharpprogrammer.com/2007/05/setting-javahome-variable-in-windows-xp.html).

To build on Mac and Linux, run build.sh. (A commented-out setter for JAVA\_HOME is available in the .sh script, which you likely will have to modify if you are not running the .bat on windows. If you uncomment this line, don't forget to **not** commit the change up to the repository.)

To build on Windows, run build.bat in cmd.

The result will be output to the ./build/ directory. Note that the ./build/ and ./temp/ directories are created by the build script, and cleaned every time the script is run. So never edit anything in the build directory. And never commit these two directories back up to the repository - they are for local use only (ideally, set the SVN "ignore" flag on them).

Note: the build scripts mentioned above will run the default Ant target ("all" in trunk/build.xml). You can also run other targets by specifying the target ID as a parameter. Example: "build.sh validate-src-specs" will only run the docbook spec validation.