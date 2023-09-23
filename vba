import pandas as pd

# Carregue a planilha Excel (substitua 'nome_da_planilha.xlsx' pelo nome do seu arquivo)
df = pd.read_excel('nome_da_planilha.xlsx', sheet_name='Lista contatos')

# Itere sobre cada linha da planilha
for index, row in df.iterrows():
    # Acesse os valores das colunas especificadas
    cliente = row['Cliente']
    email = row['E-mail']
    custodiante = row['Custodiante']
    status_contato = row['Status_Contato']

    # Realize a operação desejada com os valores
    # Por exemplo, você pode imprimir os valores ou realizar outras operações aqui
    print("Cliente:", cliente)
    print("E-mail:", email)
    print("Custodiante:", custodiante)
    print("Status de Contato:", status_contato)
    
    # Realize sua operação adicional aqui
    # Por exemplo, chame uma função ou execute algum código relacionado aos valores lidos

# Feche o arquivo da planilha
df.close()
