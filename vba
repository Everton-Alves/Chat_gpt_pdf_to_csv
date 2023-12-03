from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

# Instanciar o driver do Selenium
driver = webdriver.Chrome()  # Certifique-se de ter o webdriver adequado para o seu navegador instalado e no PATH

# URL da página onde a tabela está localizada
url = 'sua_url_aqui'
driver.get(url)

# Aguardar até que a tabela seja carregada (ajuste o tempo de espera conforme necessário)
tabela = WebDriverWait(driver, 10).until(
    EC.presence_of_element_located((By.XPATH, '//*[contains(@id, "_gridResultados")]'))
)

# Encontrar o elemento desejado no segundo <tr> e primeiro <td>
elemento_desejado = tabela.find_element(By.XPATH, './tbody/tr[2]/td[1]')

# Clicar no elemento
elemento_desejado.click()

# Fechar o navegador (opcional)
driver.quit()
