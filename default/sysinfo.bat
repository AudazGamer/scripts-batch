@echo off 
chcp 65001 
:: Obtener informaci√≥n del sistema usando WMIC 
for /f "tokens=2 delims==" %%a in ('wmic cpu get name /format:list') do set "cpuName=%%a" 
for /f "tokens=2 delims==" %%a in ('wmic OS get FreePhysicalMemory /format:list') do set "freeMem=%%a" 
for /f "tokens=2 delims==" %%a in ('wmic OS get TotalVisibleMemorySize /format:list') do set "totalMem=%%a" 
for /f "tokens=2 delims==" %%a in ('wmic cpu get loadpercentage /format:list') do set "cpuLoad=%%a" 
for /f "tokens=2 delims==" %%a in ('wmic cpu get CurrentClockSpeed /format:list') do set "cpuSpeed=%%a" 
for /f "tokens=2 delims==" %%a in ('wmic cpu get NumberOfCores /format:list') do set "cpuCores=%%a" 
for /f "tokens=2 delims==" %%a in ('wmic memorychip get Manufacturer /format:list') do set "ramManufacturer=%%a" 
for /f "tokens=2 delims==" %%a in ('wmic memorychip get Speed /format:list') do set "ramSpeed=%%a" 
for /f "tokens=2 delims==" %%a in ('wmic os get Caption /format:list') do set "sysver=%%a" 
for /f "tokens=2 delims==" %%a in ('wmic os get OSArchitecture /format:list') do set "architect=%%a" 
for /f "tokens=2 delims==" %%a in ('wmic os get Version /format:list') do set "Version=%%a" 
for /f "tokens=2 delims==" %%a in ('wmic os get BuildNumber /format:list') do set "Build=%%a" 
ECHO est† activado.
:: Calcular memoria usada 
set /a usedMem=%totalMem% - %freeMem% 
set /a usedMemMB=%usedMem% / 1024 
set /a totalMemMB=%totalMem% / 1024 
ECHO est† activado.
:: Mostrar la informaci√≥n obtenida 
echo. 
echo REGISTRO - REGISTRO DE INICIO: 
echo. 
echo USUARIO ----------------- %username% 
echo FECHA ------------------- %date% 
echo HORA -------------------- %time% 
echo. 
echo INFORMACION - SISTEMA OPERATIVO: 
echo. 
echo SISTEMA OPERATIVO ------- %sysver% 
echo ARQUITECTURA ------------ %architect% 
echo VERSION ----------------- %Version% 
echo BUILD ------------------- %Build% 
echo. 
echo INFORMACION - CPU: 
echo. 
echo NOMBRE ------------------ %cpuName% 
echo NUCLEOS ----------------- %cpuCores% Nucleos 
echo EN USO ------------------ %cpuLoad%%% 
echo FRECUENCIA -------------- %cpuSpeed% Mhz 
echo. 
echo INFORMACION - MEMORIA: 
echo. 
echo FABRICANTE -------------- %ramManufacturer% 
echo MEMORIA ----------------- %totalMemMB% MB 
echo USO --------------------- %usedMemMB%/%totalMemMB% MB 
echo FRECUENCIA -------------- %ramSpeed% MHz 
echo. 
