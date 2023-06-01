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

# Definir uma lista para armazenar os IDs dos checkboxes
ids_relacionados = []

while True:
    # Localizar todos os checkboxes dentro da tabela usando XPath
    checkboxes = driver.find_elements(By.XPATH, 'xpath_da_tabela//input[@type="checkbox"]')

    # Extrair os IDs dos checkboxes e armazenar na lista
    ids_relacionados.extend([checkbox.get_attribute('id') for checkbox in checkboxes])

    # Clicar em todos os checkboxes da tabela
    for checkbox in checkboxes:
        checkbox.click()

    # Verificar se há um próximo número para clicar
    try:
        # Encontrar o próximo número
        proximo_numero = driver.find_element(By.XPATH, 'xpath_do_proximo_numero')
        
        # Clicar no próximo número para alterar a tabela
        proximo_numero.click()
        
        # Aguardar até que a tabela seja atualizada
        wait.until(EC.staleness_of(checkboxes[0]))
    except:
        # Se não houver próximo número, sair do loop
        break

# Fechar o navegador
driver.quit()

# Exibir os IDs dos checkboxes armazenados
print(ids_relacionados)
