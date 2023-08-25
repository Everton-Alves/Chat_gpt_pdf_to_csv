from selenium import webdriver
from selenium.webdriver.common.action_chains import ActionChains

# Configurar o driver do Selenium (no exemplo, estou usando o Chrome)
driver = webdriver.Chrome(executable_path='caminho_para_o_chromedriver.exe')

# Abrir a página da web
url = "URL_da_pagina"
driver.get(url)

# Criar uma instância de ActionChains
actions = ActionChains(driver)

# Definir as coordenadas para o clique
x_coord = 100
y_coord = 200

# Mover o cursor para as coordenadas e clicar
actions.move_by_offset(x_coord, y_coord).click().perform()

# Fechar o navegador
driver.quit()
