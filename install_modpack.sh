#!/bin/bash

# Verifica se o parâmetro foi fornecido
if [ $# -eq 0 ]; then
    echo "Nenhum URL fornecido, pulando instalação de modpack."
    exit 0
fi

MODPACK_URL="$1"
MODPACK_ZIP="modpack.zip"
MODPACK_DIR="mods"

# Verifica se o wget está instalado
if ! command -v wget &> /dev/null; then
    echo "Erro: wget não está instalado." >&2
    exit 1
fi

# Verifica se o unzip está instalado
if ! command -v unzip &> /dev/null; then
    echo "Erro: unzip não está instalado." >&2
    exit 1
fi

echo "Baixando modpack de ${MODPACK_URL}..."
if ! wget --tries=3 --timeout=30 -O "${MODPACK_ZIP}" "${MODPACK_URL}"; then
    echo "Erro ao baixar o modpack de ${MODPACK_URL}" >&2
    exit 1
fi

# Verifica se o arquivo baixado é um ZIP válido
if ! unzip -t "${MODPACK_ZIP}" &> /dev/null; then
    echo "Erro: O arquivo baixado não é um ZIP válido ou está corrompido." >&2
    rm -f "${MODPACK_ZIP}"
    exit 1
fi

echo "Descompactando modpack..."
if ! unzip -o -q "${MODPACK_ZIP}" -d "${MODPACK_DIR}"; then
    echo "Erro ao descompactar o modpack." >&2
    echo "Verifique se o diretório ${MODPACK_DIR} existe e tem permissões adequadas." >&2
    rm -f "${MODPACK_ZIP}"
    exit 1
fi

echo "Modpack instalado com sucesso em ${MODPACK_DIR}/"
rm -f "${MODPACK_ZIP}"
