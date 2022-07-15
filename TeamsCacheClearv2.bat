@ECHO OFF

GOTO :menu

:menu 
echo =============================================================
echo ==               TEAMS CACHE CLEANER/UPDATER               ==
echo ==                ***RUN AS ADMINISTRATOR***               ==
echo ==  THIS TOOL CLOSES TEAMS, CLEARS CACHE, AND UPDATES      ==
echo ==  CLEANS CACHE, GPUCACHE, DATABASES, INDEXDB, APPDATA,   ==
echo ==  LOCAL STORAGE, TMP, BLOB STORAGE FOLDERS AND UPDATES   ==
echo ==              CREATED BY TYLER C. @0xTylerr              ==
echo ============================================================= 
echo TO BEGIN, SELECT AN OPTION
echo 1. Begin Clearing Cache
echo 2. Exit

set /P M=Type 1 or 2 and then press enter:
if %M%==1 goto :clean
if %M%==2 goto :kill

@ECHO ON 

:clean
taskkill /f /t /fi "IMAGENAME eq teams.exe"
del /f /q %appdata%\Microsoft\Teams\Cache\*.* > nul 2>&1
del /f /q %appdata%\Microsoft\Teams\GPUcache\*.* > nul 2>&1
del /f /q %appdata%\Microsoft\Teams\databases\*.* > nul 2>&1
del /f /q %appdata%\Microsoft\Teams\IndexDB\*.* > nul 2>&1
del /f /q %appdata%\Microsoft\Teams\Local Storage\*.* > nul 2>&1
del /f /q %appdata%\Microsoft\Teams\tmp\*.* > nul 2>&1
del /f /q %appdata%\Microsoft\Teams\blob_storage\*.* > nul 2>&1
C:\Users\%USERNAME%\Appdata\Local\Microsoft\Teams\Update.exe --processStart Teams.exe

:kill
exit