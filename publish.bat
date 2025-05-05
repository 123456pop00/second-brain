@echo off
echo Kiem tra Python...
python --version >nul 2>&1
if errorlevel 1 (
    echo Loi: Python khong duoc cai dat. Vui long cai dat Python truoc.
    pause
    exit /b 1
)

echo Kiem tra moi truong ao...
if not exist venv (
    echo Dang tao moi truong ao...
    python -m venv venv
) else (
    echo Moi truong ao da ton tai.
)

echo Dang kich hoat moi truong ao...
call venv\Scripts\activate

echo Dang install package...
pip install --no-cache-dir mkdocs_puml pymdown-extensions mkdocs-markdownextradata-plugin mkdocs-glightbox
pip install mkdocs mkdocs-material

echo Dang build site...
cd mkdocs
mkdocs build

echo Dang deploy len GitHub Pages...
mkdocs gh-deploy

echo Hoan thanh! Nhan phim bat ky de thoat...
pause