from selenium import webdriver
from selenium.webdriver.chrome.service import Service as ChromeService

# Caminho para o executável do Chrome
chrome_path = '/caminho/para/o/executavel/do/chrome'

# Configurar o serviço do Chrome com a opção --no-sandbox
chrome_service = ChromeService(executable_path=chrome_path, args=['--no-sandbox'])

# Configurar as opções do Chrome
chrome_options = webdriver.ChromeOptions()
chrome_options.add_argument('--no-sandbox')
chrome_options.add_argument('--disable-dev-shm-usage')

# Iniciar o navegador Chrome
driver = webdriver.Chrome(service=chrome_service, options=chrome_options)

# URL para abrir no navegador
url = 'https://www.exemplo.com'
driver.get(url)

# Realizar outras operações do Selenium aqui

# Fechar o navegador
driver.quit()
