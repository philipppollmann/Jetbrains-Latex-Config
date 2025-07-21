#!/bin/bash

# === CHECK FOR HOMEBREW ===
if ! command -v brew &> /dev/null; then
    echo "🔧 Homebrew not found. Install Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "✅ Homebrew is ready to use."
fi

# === UPDATE HOMEBREW ===
echo "🔄 Homebrew Update..."
brew update

# === INSTALL TEX LIVE ===
echo "📦 Install TeX Live (Basic)..."
brew install --cask mactex

echo 'export PATH="/Library/TeX/texbin:$PATH"' >> ~/.zprofile
source ~/.zprofile

# === INSTALL SKIM PDF VIEWER ===
echo "📖 Install Skim PDF Viewer"
brew install --cask skim

# === TESTE INSTALLATION ===
echo "🧪 Teste pdflatex-Version:"
pdflatex --version

mkdir -p ~/latex-intellij
cd ~/latex-intellij


# === KOMPILIERE ERSTMALIG ZUR TESTSICHERHEIT ===
pdflatex main.tex

# === SKIM ÖFFNEN ===
open -a Skim main.pdf

echo "✅ Fertig! Du kannst jetzt IntelliJ öffnen und das Projekt ~/latex-intellij importieren."