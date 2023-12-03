from selenium import webdriver

# Instanciar o driver do Selenium
driver = webdriver.Chrome()  # Certifique-se de ter o webdriver adequado para o seu navegador instalado e no PATH

# URL da página onde o elemento está localizado
url = 'sua_url_aqui'
driver.get(url)

# Encontrar o elemento com base no texto "PAULO" dentro da tag <a>
elemento_paulo = driver.find_element_by_xpath('//a[contains(text(), "PAULO")]')

# Clicar no elemento
elemento_paulo.click()

# Fechar o navegador (opcional)
driver.quit()
