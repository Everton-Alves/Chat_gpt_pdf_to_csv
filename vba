from selenium import webdriver
from selenium.webdriver.common.alert import Alert
from selenium.webdriver.common.by import By
from selenium.common.exceptions import NoAlertPresentException
import time

# Configuração do driver (exemplo com o Chrome)
driver = webdriver.Chrome(executable_path='/caminho/para/seu/chromedriver')  # Coloque o caminho do seu chromedriver

# Acessa a página desejada
driver.get("URL_da_sua_página")

# Espera um pouco para garantir que os alertas tenham tempo de aparecer
time.sleep(3)

try:
    # Verifica se há um alerta presente
    alert = Alert(driver)  # Tenta acessar o alerta
    alert.accept()  # Clica no botão "OK" (accept)
    print("Alerta encontrado e clicado em OK.")
except NoAlertPresentException:
    print("Nenhum alerta presente.")

# Fechar o navegador
driver.quit()
