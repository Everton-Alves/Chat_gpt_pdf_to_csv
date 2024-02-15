import tabula
import pandas as pd

def extrair_dados_pdf(input_pdf, output_excel):
    # Extrair tabelas do PDF
    tables = tabula.read_pdf(input_pdf, pages='all', multiple_tables=True)

    # Inicializar um DataFrame vazio para armazenar os dados
    dados_df = pd.DataFrame()

    # Iterar sobre as tabelas extraídas
    for tabela in tables:
        # Verificar se a tabela contém as colunas desejadas
        if 'Nome do Ativo' in tabela.columns and 'Data de Compra' in tabela.columns \
                and 'Data de Vencimento' in tabela.columns and 'PU' in tabela.columns \
                and 'Valor da Cota' in tabela.columns:
            # Adicionar a tabela ao DataFrame
            dados_df = pd.concat([dados_df, tabela], ignore_index=True)

    # Salvar os dados no Excel
    dados_df.to_excel(output_excel, index=False, engine='openpyxl')

if __name__ == "__main__":
    # Substitua 'extrato.pdf' pelo caminho do seu arquivo PDF de extrato
    arquivo_pdf = 'extrato.pdf'
    
    # Substitua 'saida.xlsx' pelo caminho desejado para o arquivo Excel de saída
    arquivo_excel = 'saida.xlsx'

    # Chamar a função para extrair dados e criar o arquivo Excel
    extrair_dados_pdf(arquivo_pdf, arquivo_excel)

    print(f'Dados extraídos do PDF e salvos em {arquivo_excel}')
