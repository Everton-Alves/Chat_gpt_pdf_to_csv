import tabula
import pandas as pd

# Nome do arquivo PDF do extrato bancário
pdf_file = 'extrato_bancario.pdf'

# Local onde salvar o arquivo Excel
excel_file = 'extrato_bancario.xlsx'

# Extrair tabelas do PDF
tables = tabula.read_pdf(pdf_file, pages='all')

# Converter as tabelas em um único DataFrame (se houver várias tabelas)
df = pd.concat(tables)

# Salvar o DataFrame em um arquivo Excel
df.to_excel(excel_file, index=False, engine='openpyxl')

print(f'Extrato bancário convertido para {excel_file}')
