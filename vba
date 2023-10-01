from selenium import webdriver

# Caminho para o executável do Microsoft Edge WebDriver
edge_driver_path = 'caminho/para/edge/webdriver.exe'

# Iniciar o navegador Microsoft Edge
driver = webdriver.Edge(edge_driver_path)

# URL para abrir no navegador
url = 'https://www.exemplo.com'
driver.get(url)

# Realizar outras operações do Selenium aqui

# Fechar o navegador
driver.quit()
