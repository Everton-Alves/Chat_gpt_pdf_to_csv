from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.common.action_chains import ActionChains

# Inicialize o WebDriver (por exemplo, para o Chrome)
driver = webdriver.Chrome()

# URL da página onde está o elemento
url = "https://www.example.com"

try:
    # Abre a página
    driver.get(url)

    # Aguarda até que o elemento esteja presente e visível (ajuste o tempo máximo conforme a necessidade)
    tempo_max_espera = 10
    elemento = WebDriverWait(driver, tempo_max_espera).until(
        EC.visibility_of_element_located((By.ID, "elemento_id"))
    )

    # Move o mouse sobre o elemento
    acoes_do_mouse = ActionChains(driver)
    acoes_do_mouse.move_to_element(elemento).perform()

    # Fechar o navegador após a interação (opcional)
    driver.quit()

except Exception as e:
    print(f"Erro: {e}")
    driver.quit()
