from selenium import webdriver
from selenium.webdriver.common.action_chains import ActionChains

# Configuração do driver do Selenium (escolha o driver adequado para o seu navegador)
driver = webdriver.Chrome(executable_path='caminho_para_o_chromedriver')

# URL da página que contém o elemento alvo
url = 'URL_DA_PAGINA_AQUI'

# Acesse a página
driver.get(url)

# Localize o elemento alvo pelo seu seletor CSS (ou XPath, se preferir)
elemento_alvo = driver.find_element_by_css_selector('seletor_css_do_elemento')

# Instanciar a classe ActionChains
actions = ActionChains(driver)

# Mover o mouse para o elemento alvo
actions.move_to_element(elemento_alvo).perform()

# Feche o navegador
driver.quit()
