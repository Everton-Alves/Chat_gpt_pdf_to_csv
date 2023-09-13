from selenium import webdriver

# Inicialize o driver do Selenium (substitua 'chrome' pelo seu navegador de escolha)
driver = webdriver.Chrome()

# Abra a página da web
driver.get("URL_DA_PAGINA")

# Localize o elemento do combobox por XPath
# Substitua 'XPATH_DO_COMBOBOX' pelo XPath real do seu combobox
combobox = driver.find_element_by_xpath("XPATH_DO_COMBOBOX")

# Clique no combobox para abrir as opções
combobox.click()

# Localize a opção desejada por seu texto visível e clique nela
# Substitua 'OPCAO_DESEJADA' pelo texto da opção que você deseja selecionar
driver.find_element_by_xpath(f"//*[text()='{OPCAO_DESEJADA}']").click()

# Execute outras ações no site, se necessário...

# Feche o navegador quando terminar
driver.quit()
