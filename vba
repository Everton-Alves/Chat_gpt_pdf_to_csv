from selenium import webdriver
from selenium.webdriver.common.keys import Keys

# Configuração do driver do Selenium (escolha o driver adequado para o seu navegador)
driver = webdriver.Chrome(executable_path='caminho_para_o_chromedriver')

# URL da página onde você deseja simular a pressão da tecla Tab
url = 'URL_DA_PAGINA_AQUI'

# Número de vezes que você deseja pressionar a tecla Tab
quantidade_de_tabs = 15

# Acesse a página
driver.get(url)

# Localize um elemento na página para garantir que ela esteja ativa
# Por exemplo, você pode localizar o body ou outro elemento visível
elemento_qualquer = driver.find_element_by_tag_name('body')

# Simule a pressão da tecla Tab várias vezes
for _ in range(quantidade_de_tabs):
    elemento_qualquer.send_keys(Keys.TAB)

# Feche o navegador
driver.quit()
