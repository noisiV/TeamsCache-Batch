@echo off
mode con:cols=130 lines=30
goto:main

:main
echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo +															        +
echo +							ClearTeamsCache.bat							+
echo +			This script will close the Teams, clear the cache, blob_storage, GPUCache, tmp folder,                  +
echo +			          and various other teams caches. Then, relaunches and updates Teams				+
echo +																+
echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

pause
echo "Killing Microsoft Teams Process(es)."
taskkill /f /t /fi "IMAGENAME eq teams.exe"
echo "Microsoft Teams has been Terminated. Press "Enter" to begin deleting the cache files."
pause
del /f /q "%appdata%\Microsoft\teams\application cache\cache\*.*" > nul 2>&1
del /f /q "%appdata%\Microsoft\teams\blob_storage\*.*" > nul 2>&1
del /f /q "%appdata%\Microsoft\teams\databases\*.*" > nul 2>&1
del /f /q "%appdata%\Microsoft\teams\GPUcache\*.*" > nul 2>&1
del /f /q "%appdata%\Microsoft\teams\IndexdDB\*.db" > nul 2>&1
del /f /q "%appdata%\Microsoft\teams\Local Storage\*.*" > nul 2>&1
del /f /q "%appdata%\Microsoft\teams\tmp\*.*" > nul 2>&1
echo "Microsoft Team's Cache was sucessfully cleared. Press "Enter" to re-launch the Teams process."
pause
C:\Users\%USERNAME%\AppData\Local\Microsoft\Teams\Update.exe --processStart Teams.exe
echo "Microsoft Teams has been restarted. The process has completed successfully. This window will close shortly."
timeout /t 5 /nobreak
exit