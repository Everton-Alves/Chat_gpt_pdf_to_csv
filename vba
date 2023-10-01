from selenium import webdriver
from selenium.webdriver.edge.service import Service

# Caminho para o executável do Microsoft Edge WebDriver
edge_driver_path = 'caminho/para/edge/webdriver.exe'

# Configurar o serviço do Edge WebDriver
edge_service = Service(edge_driver_path)

# Iniciar o navegador Microsoft Edge
driver = webdriver.Edge(service=edge_service)

# URL para abrir no navegador
url = 'https://www.exemplo.com'
driver.get(url)

# Realizar outras operações do Selenium aqui

# Fechar o navegador
driver.quit()
