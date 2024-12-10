from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.common.exceptions import TimeoutException
from selenium.webdriver.common.alert import Alert

# Configuração do navegador
driver = webdriver.Chrome()

# Navegar para a página desejada
driver.get('URL_DA_SUA_PAGINA')

# Tempo máximo de espera pelo alerta (em segundos)
tempo_maximo_espera = 10

try:
    # Esperar até que o alerta esteja presente
    WebDriverWait(driver, tempo_maximo_espera).until(EC.alert_is_present())

    # Mudar o foco para o alerta
    alerta = Alert(driver)

    # Clicar no botão "OK" do alerta
    alerta.accept()

    print("Alerta encontrado e aceito.")

except TimeoutException:
    print("Nenhum alerta foi encontrado dentro do tempo limite.")

# Fechar o navegador
driver.quit()
