from selenium import webdriver
from selenium.webdriver.common.by import By

# Configuração do webdriver (certifique-se de ter o driver apropriado para o navegador instalado)
driver = webdriver.Chrome()

# URL da página
url = "sua_url_aqui"
driver.get(url)

# Parte do XPath que identifica o elemento 'gridResultados'
xpath_base = "//div[contains(@id, 'gridResultados')]"

# Encontrar todos os elementos que correspondem à parte do XPath fornecida
elementos_grid_resultados = driver.find_elements(By.XPATH, xpath_base)

# Iterar sobre os elementos para encontrar o elemento clicável com 'href'
for elemento in elementos_grid_resultados:
    # Verificar se o elemento tem um atributo 'href'
    if elemento.get_attribute("href"):
        # Clicar no elemento clicável
        elemento.click()
        break  # Se você só quer clicar no primeiro elemento encontrado, remova esta linha se desejar continuar procurando

# Fechar o navegador no final do script (ou você pode querer manipular outras páginas)
driver.quit()
