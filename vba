#!/bin/bash

# Define o diretório onde os arquivos estão localizados
diretorio="/caminho/para/o/diretorio"

# Loop através dos arquivos com a extensão "XML-OK" no diretório
for arquivo in "$diretorio"/*.XML-OK; do
    # Extrai o nome do arquivo sem a extensão
    nome_arquivo=$(basename "$arquivo" .XML-OK)
    
    # Renomeia o arquivo para a extensão "XML"
    mv "$arquivo" "$diretorio/$nome_arquivo.XML"
    
    echo "Arquivo $nome_arquivo.XML-OK renomeado para $nome_arquivo.XML"
done

echo "Renomeação concluída."
