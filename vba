import re
from selenium import webdriver
from selenium.webdriver.common.by import By

# Inicializa o driver do Selenium (substitua 'caminho_para_o_executável_do_chromedriver' pelo caminho real)
driver = webdriver.Chrome(executable_path='caminho_para_o_executável_do_chromedriver')

# Abre a página da web
driver.get('URL_DA_PÁGINA')

# Encontra o elemento pelo nome da classe
elemento = driver.find_element(By.CLASS_NAME, 'vaxel-text-subtitle-01')

# Obtém o texto do elemento
texto = elemento.text

# Usa expressão regular para extrair o mês e o ano
padrao = r'(\w+) de (\d{4})'
correspondencia = re.search(padrao, texto)

# Se houver uma correspondência, armazena o mês e o ano
if correspondencia:
    mes = correspondencia.group(1)  # Obtém o nome do mês
    ano = correspondencia.group(2)  # Obtém o ano
else:
    mes = None
    ano = None

# Fecha o navegador
driver.quit()

# Imprime o mês e o ano extraídos
print("Mês:", mes)
print("Ano:", ano)
