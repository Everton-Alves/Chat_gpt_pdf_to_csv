from selenium import webdriver

# Configuração do driver do Selenium (escolha o driver adequado para o seu navegador)
driver = webdriver.Chrome(executable_path='caminho_para_o_chromedriver')

# URL da página onde você deseja encontrar o texto e clicar nele
url = 'URL_DA_PAGINA_AQUI'

# Texto que você deseja encontrar e clicar
texto_alvo = 'Texto_Alvo_Aqui'

# Acesse a página
driver.get(url)

# Encontre o elemento que contém o texto
elemento_com_texto = driver.find_element_by_xpath(f'//*[contains(text(), "{texto_alvo}")]')

# Clique no elemento com o texto
elemento_com_texto.click()

# Feche o navegador
driver.quit()
