import openpyxl

# Carregar o arquivo Excel
excel_file_path = 'caminho/para/o/seu/arquivo.xlsx'
wb = openpyxl.load_workbook(excel_file_path)

# Selecionar a planilha "Contatos"
sheet = wb['Contatos']

# Iterar pelas células da coluna B (nomes)
column_b = sheet['B']
for cell in column_b:
    nome = cell.value
    if nome:
        print(nome)  # Aqui você pode substituir pelo processamento desejado para cada nome

# Fechar o arquivo Excel
wb.close()
