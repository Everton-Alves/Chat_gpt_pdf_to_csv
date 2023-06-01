from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

# Configurar o Selenium e o navegador
driver = webdriver.Chrome('caminho_para_o_seu_chromedriver')
wait = WebDriverWait(driver, 10)

# Acessar a página inicial
driver.get('url_da_pagina_inicial')

# Realizar interações para acessar a página com a tabela
# ...

# Localizar o elemento que leva à página com a tabela e clicar nele
elemento_link = wait.until(EC.presence_of_element_located((By.ID, 'id_do_elemento_link')))
elemento_link.click()

# Aguardar até que a página com a tabela seja carregada
wait.until(EC.presence_of_element_located((By.CSS_SELECTOR, 'table')))

# Localizar todos os checkboxes dentro da tabela
checkboxes = driver.find_elements(By.CSS_SELECTOR, 'table input[type="checkbox"]')

# Extrair os IDs dos checkboxes
ids_relacionados = [checkbox.get_attribute('id') for checkbox in checkboxes]

# Iterar sobre os IDs relacionados e clicar nos checkboxes correspondentes
for id_relacionado in ids_relacionados:
    # Localizar o checkbox com base no ID relacionado
    checkbox = driver.find_element(By.ID, id_relacionado)
    
    # Clicar no checkbox
    checkbox.click()

# Fechar o navegador
driver.quit()
