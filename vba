from selenium import webdriver
from selenium.webdriver.common.by import By

# Inicializa o driver do Selenium (certifique-se de ter o WebDriver correspondente ao seu navegador instalado)
driver = webdriver.Chrome()

# URL do site que você está visitando
url = "https://exemplo.com"
driver.get(url)

# Parte específica do XPath que você está procurando
parte_do_xpath = "txtValorCampo"

# Constrói a expressão XPath usando a função contains()
xpath_expression = f"//*[contains(@id, '{parte_do_xpath}')]"

# Encontra o elemento usando a expressão XPath
elemento = driver.find_element(By.XPATH, xpath_expression)

# Clica no elemento
elemento.click()

# Fecha o navegador
driver.quit()
