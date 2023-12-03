from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

# Configurar o WebDriver (certifique-se de ter o driver adequado instalado)
driver = webdriver.Chrome()  # Substitua por Firefox ou outro driver, se preferir

# URL do site onde o elemento está localizado
url = "url_do_seu_site_aqui"
driver.get(url)

try:
    # Esperar até que o elemento seja visível
    elemento = WebDriverWait(driver, 10).until(
        EC.visibility_of_element_located((By.XPATH, '//a[contains(@href, "javascript:_doPostBack")]'))
    )

    # Clicar no elemento
    elemento.click()

finally:
    # Fechar o navegador após o clique
    driver.quit()
