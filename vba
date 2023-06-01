from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

# Configurar o driver do Selenium (certifique-se de ter o chromedriver instalado e no PATH)
driver = webdriver.Chrome()

# Navegar até a página com a tabela
driver.get("URL_DA_PAGINA")

# Aguardar até que a tabela seja carregada (usando uma espera explícita)
wait = WebDriverWait(driver, 10)
table = wait.until(EC.presence_of_element_located((By.ID, "ID_DA_TABELA")))

# Localizar todos os checkboxes dentro da tabela
checkboxes = table.find_elements(By.TAG_NAME, "input[type='checkbox']")

# Iterar sobre os checkboxes e clicar em cada um
for checkbox in checkboxes:
    checkbox.click()

# Fechar o navegador
driver.quit()
