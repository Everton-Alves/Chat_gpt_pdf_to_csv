from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

# Inicializar o driver do Selenium
driver = webdriver.Chrome()

# Abrir a página web
driver.get("https://www.exemplo.com")

# Esperar até que a tabela seja carregada
wait = WebDriverWait(driver, 10)
tabela = wait.until(EC.presence_of_element_located((By.ID, "id-da-tabela")))

# Encontrar todos os checkboxes dentro da tabela
checkboxes = tabela.find_elements(By.XPATH, "//input[@type='checkbox']")

# Clicar em todos os checkboxes
for checkbox in checkboxes:
    checkbox.click()

# Fechar o driver do Selenium
driver.quit()
