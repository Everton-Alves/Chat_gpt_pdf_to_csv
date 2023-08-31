from selenium import webdriver

# Inicializar o driver do Selenium
driver = webdriver.Chrome(executable_path="caminho/para/chromedriver")

# Abrir a página da web
driver.get("URL_da_página_a_ser_aberta")  # Substitua pela URL correta

# Parte do nome do elemento que você deseja encontrar
parte_do_nome = "btnBuscar"

# Criar uma expressão XPath que contém a parte do nome
xpath_pattern = f"//*[contains(@id, '{parte_do_nome}') or contains(@name, '{parte_do_nome}')]"

# Encontrar todos os elementos correspondentes
elementos = driver.find_elements_by_xpath(xpath_pattern)

# Clicar em cada elemento encontrado
for elemento in elementos:
    elemento.click()

# Fechar o navegador
driver.quit()
