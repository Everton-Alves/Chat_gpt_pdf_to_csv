from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

# Configuração do WebDriver (certifique-se de ter o WebDriver instalado e no PATH)
driver = webdriver.Chrome()

# URL do site
url = "URL_DO_SEU_SITE_AQUI"
driver.get(url)

# Parte do XPath fornecida
parte_do_xpath = "_gridResultados\"]tbody/tr[2]/td[1]/a"

# Construindo o XPath completo
xpath = "//*[contains(@id, '" + parte_do_xpath + "')]"

# Aguardando a presença do elemento na página
element = WebDriverWait(driver, 10).until(
    EC.presence_of_element_located((By.XPATH, xpath))
)

# Realizando a ação desejada no elemento
element.click()

# Fechar o navegador após a conclusão
driver.quit()
