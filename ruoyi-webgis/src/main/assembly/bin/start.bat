@echo off & setlocal enabledelayedexpansion

set LIB_JARS=""
Set MAIN_CLASS=com.ruoyi.webgis.NginxManagerApplication
cd ..\lib
for %%i in (*) do set LIB_JARS=!LIB_JARS!;..\lib\%%i
cd ..\bin

if ""%2"" == ""debug"" goto debug
if ""%2"" == ""jmx"" goto jmx
if ""%1"" == """" goto test 

java -Xms64m -Xmx1024m -XX:MaxPermSize=128M -classpath ..\conf;%LIB_JARS% %MAIN_CLASS% --spring.profiles.active=%1
goto end

:test
java -Xms64m -Xmx1024m -XX:MaxPermSize=128M -classpath ..\conf;%LIB_JARS% %MAIN_CLASS%
goto end

:debug
java -Xms64m -Xmx1024m -XX:MaxPermSize=128M -Xdebug -Xnoagent -Djava.compiler=NONE -Xrunjdwp:transport=dt_socket,address=8000,server=y,suspend=n -classpath ..\conf;%LIB_JARS% %MAIN_CLASS%
goto end

:jmx
java -Xms64m -Xmx1024m -XX:MaxPermSize=128M -Dcom.sun.management.jmxremote.port=1099 -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.authenticate=false -classpath ..\conf;%LIB_JARS% %MAIN_CLASS%

:end
pause