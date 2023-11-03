import openpyxl

# Carregue a planilha
wb = openpyxl.load_workbook('caminho_para_o_arquivo.xlsx')
Sheet = wb['nome_da_planilha']

# Itere sobre os valores da coluna D
column_d = Sheet['D']
for cell in column_d:
    # Obtenha o valor da coluna D
    conta_corrente = cell.value

    # Obtenha os valores das colunas A, B e C na mesma linha
    linha = cell.row
    valor_coluna_a = Sheet.cell(row=linha, column=1).value
    valor_coluna_b = Sheet.cell(row=linha, column=2).value
    valor_coluna_c = Sheet.cell(row=linha, column=3).value

    # Faça o que for necessário com os valores obtidos
    print(f'Conta Corrente: {conta_corrente}, Coluna A: {valor_coluna_a}, Coluna B: {valor_coluna_b}, Coluna C: {valor_coluna_c}')

# Feche a planilha após o processamento
wb.close()
