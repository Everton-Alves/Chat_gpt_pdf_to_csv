from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

# Inicialize o WebDriver (por exemplo, para o Chrome)
driver = webdriver.Chrome()

# URL da página onde está o elemento
url = "https://www.example.com"

# Tempo máximo de espera para localizar o elemento (ajuste conforme a sua necessidade)
tempo_max_espera = 10

try:
    # Abre a página
    driver.get(url)

    # Espera até que o elemento com class="btn" e type="submit" esteja presente e visível
    elemento_btn = WebDriverWait(driver, tempo_max_espera).until(
        EC.element_to_be_clickable((By.CSS_SELECTOR, 'button.btn[type="submit"]'))
    )

    # Clica no elemento
    elemento_btn.click()

    # Fechar o navegador após o clique (opcional)
    driver.quit()

except Exception as e:
    print(f"Erro: {e}")
    driver.quit()
