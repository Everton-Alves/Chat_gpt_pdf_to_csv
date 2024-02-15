import PyPDF2
import pandas as pd

def extract_info_from_pdf(file_path):
    pdf_file_obj = open(file_path, 'rb')
    pdf_reader = PyPDF2.PdfFileReader(pdf_file_obj)
    num_pages = pdf_reader.numPages
    text = ''
    for page in range(num_pages):
        page_obj = pdf_reader.getPage(page)
        text += page_obj.extractText()
    pdf_file_obj.close()
    return text

def write_to_excel(data, file_path):
    df = pd.DataFrame(data)
    df.to_excel(file_path, index=False)

# Exemplo de uso
pdf_text = extract_info_from_pdf('extrato.pdf')

# Aqui você deve implementar a lógica para extrair as informações necessárias do texto do PDF.
# Este é um exemplo simplificado e você precisará ajustá-lo de acordo com o formato do seu extrato.
data = {
    'nome do ativo': [],
    'data de compra': [],
    'data de vencimento': [],
    'preço unico (PU)': [],
    'valor da cota': [],
    # adicione aqui outras informações necessárias
}

write_to_excel(data, 'extrato.xlsx')
