from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

# Inicializar o driver do Selenium
driver = webdriver.Chrome()

# Abrir a página
driver.get("URL_DA_PAGINA")

# Esperar até que o elemento esteja visível
elemento = WebDriverWait(driver, 10).until(EC.visibility_of_element_located((By.XPATH, "//a[@class='level2 dynamic' and @href='/wh/NetReport/report-type.aspx']")))

# Clicar no elemento
elemento.click()

# Fechar o navegador
driver.quit()
