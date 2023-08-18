import xml.etree.ElementTree as ET
from openpyxl import Workbook

# Carregar o arquivo XML
tree = ET.parse('seuarquivo.xml')
root = tree.getroot()

# Criar um novo arquivo Excel
wb = Workbook()
ws = wb.active

# Iterar pelos elementos do XML e adicionar ao Excel
for item in root:
    row = []
    for child in item:
        row.append(child.text)
    ws.append(row)

# Salvar o arquivo Excel
wb.save('output.xlsx')
