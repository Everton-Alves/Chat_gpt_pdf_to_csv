import os
import xml.etree.ElementTree as ET
from openpyxl import Workbook

# Pasta contendo os arquivos XML
pasta_xmls = 'caminho/para/sua/pasta'

# Criar um novo arquivo Excel
wb = Workbook()
ws = wb.active

def get_nested_values(element):
    values = []
    for child in element:
        values.append(child.text if child.text else '')
    return values

# Flag para verificar se o cabeçalho já foi adicionado ao arquivo Excel
header_added = False

# Iterar pelos arquivos XML na pasta
for arquivo in os.listdir(pasta_xmls):
    if arquivo.endswith('.xml'):
        # Carregar o arquivo XML
        tree = ET.parse(os.path.join(pasta_xmls, arquivo))
        root = tree.getroot()

        # Criação dos cabeçalhos das colunas (apenas uma vez)
        if not header_added:
            headers = []
            for child in root[0]:
                headers.extend([f"{child.tag}_{sub.tag}" for sub in child])
            ws.append(headers)
            header_added = True

        # Iterar pelos elementos do XML e adicionar ao Excel
        for item in root:
            row = []
            for child in item:
                row.extend(get_nested_values(child))
            ws.append(row)

# Salvar o arquivo Excel final
wb.save('output_final.xlsx')
