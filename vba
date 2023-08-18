import xml.etree.ElementTree as ET
from openpyxl import Workbook

# Carregar o arquivo XML
tree = ET.parse('seuarquivo.xml')
root = tree.getroot()

# Criar um novo arquivo Excel
wb = Workbook()
ws = wb.active

# Função para percorrer as tags aninhadas e retornar uma lista de valores
def get_nested_values(element):
    values = []
    for child in element:
        values.append(child.text if child.text else '')  # Adiciona o texto ou uma string vazia
    return values

# Criação dos cabeçalhos das colunas
headers = []
for child in root[0]:
    headers.extend([f"{child.tag}_{sub.tag}" for sub in child])  # Criação de cabeçalhos para tags aninhadas
ws.append(headers)

# Iterar pelos elementos do XML e adicionar ao Excel
for item in root:
    row = []
    for child in item:
        row.extend(get_nested_values(child))  # Adiciona valores das tags aninhadas
    ws.append(row)

# Salvar o arquivo Excel
wb.save('output.xlsx')
