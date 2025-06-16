#!/bin/bash

# Verifica se o link do modpack foi fornecido
if [ -z "https://mediafilez.forgecdn.net/files/6222/83/Cursed%20Walking%201.20.1%20-%20Version%203.0.2%20SERVERPACK.zip" ]; then
    echo "URL do modpack não fornecida, pulando instalação."
    exit 0
fi

# Nome do arquivo ZIP do modpack
MODPACK_ZIP="modpack.zip"

# Diretório de destino para extração
MODPACK_DIR="mods"

echo "Baixando modpack de https://mediafilez.forgecdn.net/files/6222/83/Cursed%20Walking%201.20.1%20-%20Version%203.0.2%20SERVERPACK.zip..."
wget -O "${MODPACK_ZIP}" "https://mediafilez.forgecdn.net/files/6222/83/Cursed%20Walking%201.20.1%20-%20Version%203.0.2%20SERVERPACK.zip"

if [ $? -ne 0 ]; then
    echo "Erro ao baixar o modpack."
    exit 1
fi

echo "Descompactando modpack..."
unzip -o "${MODPACK_ZIP}" -d "${MODPACK_DIR}"

if [ $? -ne 0 ]; then
    echo "Erro ao descompactar o modpack."
    exit 1
fi

echo "Modpack instalado com sucesso!"
rm -f "${MODPACK_ZIP}"