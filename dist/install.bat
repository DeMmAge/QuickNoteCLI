@ECHO OFF

SET dir=C:\Users\%USERNAME%\DeMmAgeSoft

IF exist %dir% ( goto Exists ) ELSE ( goto NotExists )

:NotExists
echo Creating directories...
MKDIR %dir%

:Exists

echo Copying files...
COPY /Y ..\target\QNC*.jar %dir%\QNC*.jar
COPY /Y .\util\QNC.bat %dir%\QNC.bat

echo Adding to PATH...
Powershell.exe -File .\util\AddToPath.ps1 %dir%

IF %ERRORLEVEL% NEQ 0 ( goto Error ) ELSE ( goto Success )

:Error
echo ERROR OCCURRED DURING INSTALLATION
pause
exit /b 1

:Success
echo INSTALLATION SUCCESSFUL
pause
exit /b 0

::todo Short instruction