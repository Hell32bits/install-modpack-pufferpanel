#!/bin/bash

# Verifica se o link do modpack foi fornecido
if [ -z "${modpack_url}" ]; then
    echo "Erro: URL do modpack não fornecida."
    exit 1
fi

# Nome do arquivo ZIP do modpack
MODPACK_ZIP="modpack.zip"

# Diretório de destino para extração
MODPACK_DIR="mods"

echo "Baixando modpack de ${modpack_url}..."
wget -O "${MODPACK_ZIP}" "${modpack_url}"

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
