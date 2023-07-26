from selenium import webdriver
import time

# Inicialize o WebDriver (por exemplo, para o Chrome)
driver = webdriver.Chrome()

# URL da página onde está o botão
url = "https://www.example.com"

try:
    # Abre a página
    driver.get(url)

    # Clique no botão que abre uma nova aba
    botao = driver.find_element_by_id("botao_id")
    botao.click()

    # Aguarde um tempo para garantir que a nova aba seja aberta (ajuste conforme a necessidade)
    time.sleep(2)

    # Troque o foco para a nova aba (a janela de índice 1)
    driver.switch_to.window(driver.window_handles[1])

    # Continue a automação na nova aba
    # Por exemplo, localize e interaja com elementos na nova aba:
    novo_elemento = driver.find_element_by_xpath("//seu/xpath/here")
    novo_elemento.click()

    # Feche a nova aba (opcional)
    driver.close()

    # Volte o foco para a aba original (a janela de índice 0)
    driver.switch_to.window(driver.window_handles[0])

    # Continue a automação na aba original
    # Por exemplo, localize e interaja com elementos na aba original:
    elemento_original = driver.find_element_by_xpath("//seu/xpath/here")
    elemento_original.click()

    # Fechar o navegador após a automação (opcional)
    driver.quit()

except Exception as e:
    print(f"Erro: {e}")
    driver.quit()
