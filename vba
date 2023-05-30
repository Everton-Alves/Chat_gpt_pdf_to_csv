from selenium import webdriver

# Configurar o driver do Selenium (nesse exemplo, estou usando o ChromeDriver)
driver = webdriver.Chrome()

# Abrir o site ou página onde está o elemento que você deseja clicar
driver.get("https://www.example.com")

# Localizar o elemento pelo atributo tabindex e pelo texto
element = driver.find_element_by_xpath("//a[@tabindex='-1' and contains(text(), 'Modulo de Relatórios')]")

# Clicar no elemento
element.click()

# Fechar o navegador
driver.quit()
