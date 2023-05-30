from selenium import webdriver
from selenium.webdriver.common.by import By

# Configurar o driver do Selenium (neste exemplo, estou usando o ChromeDriver)
driver = webdriver.Chrome()

# Abrir o site ou página onde está o elemento que você deseja clicar
driver.get("https://www.example.com")

# Localizar o elemento pelo texto
element = driver.find_element(By.XPATH, "//a[contains(text(), 'Módulo de Relatórios')]")

# Clicar no elemento
element.click()

# Fechar o navegador
driver.quit()
