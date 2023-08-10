from selenium import webdriver
from selenium.webdriver.common.by import By

# Inicialize o driver do Chrome (você pode alterar para o navegador de sua escolha)
driver = webdriver.Chrome(executable_path="caminho_para_o_seu_webdriver")

# Abra a página da web
driver.get("URL_da_pagina")

# Localize todos os elementos da tabela usando XPath (substitua pelo seu XPath)
linhas_da_tabela = driver.find_elements(By.XPATH, "//table[@id='id_da_tabela']//tr")

# Loop através das linhas da tabela e clique no botão correspondente em cada linha
for linha in linhas_da_tabela[1:]:  # Começando da segunda linha, excluindo cabeçalho
    botao = linha.find_element(By.XPATH, ".//button")  # Localize o botão dentro da linha
    botao.click()

# Encerre o driver
driver.quit()
