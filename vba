import xml.etree.ElementTree as ET
from openpyxl import Workbook

# Carregar o arquivo XML
tree = ET.parse('seuarquivo.xml')
root = tree.getroot()

# Criar um novo arquivo Excel
wb = Workbook()
ws = wb.active

# Criação dos cabeçalhos das colunas
headers = []
for child in root[0]:
    headers.append(child.tag)
ws.append(headers)

# Iterar pelos elementos do XML e adicionar ao Excel
for item in root:
    row = []
    for child in item:
        row.append(child.text if child.text else '')  # Adiciona o texto ou uma string vazia
    ws.append(row)

# Salvar o arquivo Excel
wb.save('output.xlsx')
