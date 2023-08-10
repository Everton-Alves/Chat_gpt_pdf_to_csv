from selenium import webdriver
from selenium.webdriver.common.by import By

# Inicialização do driver do Selenium
driver = webdriver.Chrome()  # Certifique-se de que você tenha o ChromeDriver instalado e na mesma pasta deste script

# Abra a página web
url = "URL_DA_PAGINA"
driver.get(url)

# Localize a tabela usando o XPath (substitua pelo XPath da sua tabela)
table_xpath = "//table[@id='tabela_id']"

# Encontre todas as linhas da tabela
table = driver.find_element(By.XPATH, table_xpath)
rows = table.find_elements(By.TAG_NAME, "tr")

# Loop através das linhas da tabela (começando da segunda linha, pois a primeira provavelmente é o cabeçalho)
for row in rows[1:]:
    # Clique no botão dentro da linha (substitua pelo XPath do botão na sua linha)
    button_xpath = ".//button[@class='botao_classe']"
    button = row.find_element(By.XPATH, button_xpath)
    button.click()

# Encerrar o driver
driver.quit()
