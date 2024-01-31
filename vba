from selenium import webdriver
from selenium.webdriver.common.by import By

# Configurando o caminho do ChromeDriver (substitua pelo seu caminho)
chrome_driver_path = '/caminho/para/seu/chromedriver.exe'

# Inicializando o navegador Chrome
driver = webdriver.Chrome(executable_path=chrome_driver_path)

# Abrindo a página da web
url = "URL_DA_SUA_PAGINA"
driver.get(url)

# Construindo o XPath usando starts-with
xpath_do_elemento = '//*[starts-with(@id, "ember")]'

# Localizando o elemento pelo XPath
elemento_ember = driver.find_element(By.XPATH, xpath_do_elemento)

# Imprimindo o ID do elemento encontrado
print("ID do elemento 'ember':", elemento_ember.get_attribute("id"))

# Fechando o navegador
driver.quit()
