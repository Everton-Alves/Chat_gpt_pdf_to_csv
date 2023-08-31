from selenium import webdriver

# Inicializar o driver do Selenium
driver = webdriver.Chrome(executable_path="caminho/para/chromedriver")

# Abrir a página da web
driver.get("URL_da_página_a_ser_aberta")  # Substitua pela URL correta

# Índice do elemento que você deseja selecionar (2ª correspondência)
indice_elemento = 2

# Criar o XPath com base no índice
xpath = f"(//*[contains(@id, 'btnBuscar')])[{indice_elemento}]"

# Encontrar o elemento desejado
elemento = driver.find_element_by_xpath(xpath)

# Clicar no elemento
elemento.click()

# Fechar o navegador
driver.quit()
