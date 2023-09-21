import tabula
import pandas as pd

# Nome do arquivo PDF do extrato bancário
pdf_file = 'extrato_bancario.pdf'

# Extrair texto do PDF
text = tabula.read_pdf(pdf_file, pages='all', output_format='json')

# Processar o texto para extrair informações (exemplo genérico)
data = []

for page in text:
    for item in page['data']:
        data.append([x['text'] for x in item])

# Converter os dados em um DataFrame do pandas
df = pd.DataFrame(data, columns=['Nome do Ativo', 'Quantidade', 'Imposto de Renda'])

# Salvar o DataFrame em um arquivo Excel
excel_file = 'extrato_bancario.xlsx'
df.to_excel(excel_file, index=False, engine='openpyxl')

print(f'Dados do extrato bancário salvos em {excel_file}')
