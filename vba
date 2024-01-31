from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.common.exceptions import NoSuchElementException

def encontrar_elemento_com_atualizacao(driver, by, valor, max_tentativas=3):
    tentativa = 0
    while tentativa < max_tentativas:
        try:
            elemento = driver.find_element(by, valor)
            return elemento
        except NoSuchElementException:
            print(f"Elemento não encontrado na tentativa {tentativa + 1}. Atualizando a página...")
            driver.refresh()
            tentativa += 1

    raise NoSuchElementException(f"Elemento não encontrado após {max_tentativas} tentativas.")

# Exemplo de uso
chrome_driver_path = '/caminho/para/seu/chromedriver.exe'
url = "https://example.com"

# Inicializando o navegador Chrome
driver = webdriver.Chrome(executable_path=chrome_driver_path)
driver.get(url)

# Tentando encontrar o elemento usando a função
try:
    # Substitua 'By.XPATH' e 'Seu XPath' pelos valores reais
    elemento = encontrar_elemento_com_atualizacao(driver, By.XPATH, 'Seu XPath')
    print("Elemento encontrado!")
    # Faça o que quiser com o elemento aqui
except NoSuchElementException as e:
    print(e)
finally:
    # Fechando o navegador
    driver.quit()
