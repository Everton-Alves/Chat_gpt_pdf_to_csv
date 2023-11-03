from datetime import datetime

# Dicionário para mapear nomes dos meses para valores numéricos
meses = {
    "janeiro": "01",
    "fevereiro": "02",
    "março": "03",
    "abril": "04",
    "maio": "05",
    "junho": "06",
    "julho": "07",
    "agosto": "08",
    "setembro": "09",
    "outubro": "10",
    "novembro": "11",
    "dezembro": "12"
}

# Função para converter nome do mês para número do mês e formatar como YYYY-DD
def converter_data(nome_mes, ano):
    # Converte o nome do mês para número do mês (se existir no dicionário, senão retorna None)
    numero_mes = meses.get(nome_mes.lower())
    
    # Se o nome do mês for válido, cria a string no formato YYYY-DD
    if numero_mes:
        data_formatada = f"{ano}-{numero_mes}"
        return data_formatada
    else:
        return None

# Exemplo de uso da função
nome_mes = "setembro"
ano = "2023"
data_formatada = converter_data(nome_mes, ano)

# Imprime a data formatada (ou None se o nome do mês não for válido)
print(data_formatada)
