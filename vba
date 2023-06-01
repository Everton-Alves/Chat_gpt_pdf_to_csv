from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

# Configurar o Selenium e o navegador
driver = webdriver.Chrome('caminho_para_o_seu_chromedriver')
wait = WebDriverWait(driver, 10)

# Acessar a página com a tabela
driver.get('url_da_pagina_com_a_tabela')

# Localizar todos os checkboxes dentro da tabela
checkboxes = wait.until(EC.presence_of_all_elements_located((By.CSS_SELECTOR, 'table input[type="checkbox"]')))

# Iterar sobre os checkboxes e clicar neles
for checkbox in checkboxes:
    checkbox.click()

# Fechar o navegador
driver.quit()
