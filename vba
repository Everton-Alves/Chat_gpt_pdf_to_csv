from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

# Configurar o driver do Selenium (no exemplo, estou usando o Chrome)
driver = webdriver.Chrome(executable_path='caminho_para_o_chromedriver.exe')

# Abrir a página da web
url = "URL_da_pagina"
driver.get(url)

# Localizar o elemento da combobox e clicar nele
combobox = driver.find_element(By.ID, 'id_da_combobox')  # Use o localizador correto (ID, class, XPath, etc.)
combobox.click()

# Aguardar até que as opções da combobox estejam disponíveis
wait = WebDriverWait(driver, 10)
options = wait.until(EC.presence_of_all_elements_located((By.CSS_SELECTOR, 'seletor_das_opcoes')))

# Encontrar a opção desejada pelo nome e clicar nela
opcao_desejada_nome = "Nome da Opção Desejada"
for option in options:
    if option.text == opcao_desejada_nome:
        option.click()
        break

# Fechar o navegador
driver.quit()
