from selenium import webdriver

# Configuração do driver do Selenium (escolha o driver adequado para o seu navegador)
driver = webdriver.Chrome(executable_path='caminho_para_o_chromedriver')

# URL da página que contém a tabela
url = 'URL_DA_PAGINA_AQUI'

# Acesse a página
driver.get(url)

# Localize a tabela pelo seu seletor CSS (ou XPath, se preferir)
tabela = driver.find_element_by_css_selector('seletor_css_da_tabela')

# Localize todas as linhas da tabela usando o elemento <tr>
linhas = tabela.find_elements_by_tag_name('tr')

# Contar o número de linhas da tabela
numero_de_linhas = len(linhas)

# Imprimir o número de linhas da tabela
print(f'Número de linhas na tabela: {numero_de_linhas}')

# Feche o navegador
driver.quit()
