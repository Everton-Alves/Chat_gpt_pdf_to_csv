from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

# Inicializar o navegador (no exemplo, estou usando o Chrome)
driver = webdriver.Chrome()

# URL da página que você quer testar
url = "URL_DA_PAGINA_AQUI"

# Abrir a página no navegador
driver.get(url)

# Definir o XPath do botão que você quer verificar
xpath_do_botao = "COLOQUE_AQUI_O_XPATH_DO_BOTAO"

try:
    # Aguardar até que o botão esteja presente na página
    botao = WebDriverWait(driver, 10).until(EC.presence_of_element_located((By.XPATH, xpath_do_botao)))
    
    # Se o botão estiver presente, realizar alguma ação
    if botao.is_displayed():
        print("O botão está presente e visível.")
        # Aqui você pode adicionar o código para interagir com o botão, clicando nele, por exemplo.
        # botao.click()
    else:
        print("O botão está presente, mas não está visível.")
except:
    print("O botão não foi encontrado na página.")

# Fechar o navegador
driver.quit()
