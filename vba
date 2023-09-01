from selenium import webdriver

# Inicializar o driver do Selenium
driver = webdriver.Chrome(executable_path="caminho/para/chromedriver")

# Abrir a página da web
driver.get("URL_da_página_a_ser_aberta")  # Substitua pela URL correta

# Parte do nome que você deseja encontrar
parte_do_nome = "PAULA"

# Criar o XPath para o elemento
xpath = f"//a[contains(text(), '{parte_do_nome}')]/parent::node()"

# Encontrar o elemento usando o XPath
elemento = driver.find_element_by_xpath(xpath)

# Clicar no elemento
elemento.click()

# Fechar o navegador
driver.quit()
