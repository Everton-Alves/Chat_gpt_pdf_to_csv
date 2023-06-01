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

# Encontrar o elemento que leva à página com a tabela e clicar nele
elemento_link = wait.until(EC.presence_of_element_located((By.ID, 'id_do_elemento_link')))
elemento_link.click()

# Aguardar até que a tabela seja carregada
wait.until(EC.presence_of_element_located((By.XPATH, 'xpath_da_tabela')))

# Encontrar todos os checkboxes dentro da tabela usando XPath
checkboxes = driver.find_elements(By.XPATH, 'xpath_da_tabela//input[@type="checkbox"]')

# Extrair os IDs dos checkboxes
ids_relacionados = [checkbox.get_attribute('id') for checkbox in checkboxes]

# Iterar sobre os IDs relacionados e clicar nos checkboxes correspondentes
for id_relacionado in ids_relacionados:
    # Encontrar o checkbox com base no ID relacionado usando XPath
    checkbox = driver.find_element(By.XPATH, f'//input[@type="checkbox" and @id="{id_relacionado}"]')
    
    # Clicar no checkbox
    checkbox.click()

# Fechar o navegador
driver.quit()
