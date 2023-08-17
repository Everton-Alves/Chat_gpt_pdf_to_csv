from selenium import webdriver

# Configuração do driver do Selenium (escolha o driver adequado para o seu navegador)
driver = webdriver.Chrome(executable_path='caminho_para_o_chromedriver')

# URL da página que contém a tabela
url = 'URL_DA_PAGINA_AQUI'

# Acesse a página
driver.get(url)

# Localize o elemento <td> da tabela pelo seu seletor CSS (ou XPath, se preferir)
td_element = driver.find_element_by_css_selector('seletor_css_do_td')

# Navegue para o elemento pai <tr> e, em seguida, conte todas as linhas na tabela
tr_element = td_element.find_element_by_xpath('./ancestor::tr')
table_rows = tr_element.find_elements_by_xpath('./following-sibling::tr')
num_rows = len(table_rows) + 1  # Adicione 1 para contar a linha atual

# Imprima o número de linhas da tabela
print(f'Número de linhas na tabela: {num_rows}')

# Feche o navegador
driver.quit()
