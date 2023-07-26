from selenium import webdriver
from selenium.webdriver.common.action_chains import ActionChains
from selenium.webdriver.common.keys import Keys

# Inicialize o WebDriver (por exemplo, para o Chrome)
driver = webdriver.Chrome()

# URL da página onde está o combobox
url = "https://www.example.com"

try:
    # Abre a página
    driver.get(url)

    # Encontra o elemento do combobox
    combobox = driver.find_element_by_name("Carteira")

    # Simula a abertura do combobox para carregar todas as opções
    ActionChains(driver).click(combobox).perform()
    combobox.send_keys(Keys.ARROW_DOWN)  # Percorre as opções para garantir que todas sejam carregadas

    # Encontra todas as opções do combobox
    opcoes = combobox.find_elements_by_tag_name("option")

    # Lista para armazenar os valores e textos das opções
    valores_e_textos = []

    # Armazena os valores e textos das opções na lista
    for opcao in opcoes:
        valor = opcao.get_attribute("value")
        texto = opcao.text
        valores_e_textos.append((valor, texto))

    # Laço de repetição para clicar em cada elemento do combobox
    for valor, texto in valores_e_textos:
        # Clica na opção do combobox pelo valor
        combobox.click()
        combobox.find_element_by_xpath(f"option[@value='{valor}']").click()

        # Continue a automação com a opção selecionada, por exemplo, clique em um botão, envie formulários, etc.
        # ...
        
        # Imprime o valor e o texto da opção atual (opcional)
        print(f"Valor: {valor}, Texto: {texto}")

    # Fechar o navegador após a automação (opcional)
    driver.quit()

except Exception as e:
    print(f"Erro: {e}")
    driver.quit()
