@if "%~1"=="" (
	@echo Please provide a path to the installed DECTalk folder
	@echo Usage: setup.bat "Path\ To\ DECTalk\"
	exit /b
)
setlocal
@set dectalk_install_path=%1
@echo ========================================
@mkdir dapi\src\api
@echo Copying header from your DECTalk install path: '%dectalk_install_path%'
@copy "%dectalk_install_path%\include\TTSAPI.h" ttsapi.h
@echo ========================================
@echo Copying lib files...
@for %%x in (us uk fr sp gr la) do @(
	@echo Copying lib files for %%x...
	mkdir dapi\build\dectalk\%%x\release
	copy "%dectalk_install_path%\%%x\dectalk.lib" dapi\build\dectalk\%%x\release
)
@echo Done!
@echo ========================================
endlocal
