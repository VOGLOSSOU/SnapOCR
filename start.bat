@echo off
echo ==================================================
echo 📸 SnapOCR - Demarrage
echo ==================================================
echo.
echo 🌐 Serveur demarre sur http://localhost:8000
echo.
echo 📝 Ouvrez votre navigateur et allez sur :
echo    http://localhost:8000
echo.
echo ==================================================
echo Appuyez sur Ctrl+C pour arreter
echo ==================================================
echo.

python -m http.server 8000
pause