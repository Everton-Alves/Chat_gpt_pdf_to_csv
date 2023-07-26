from selenium import webdriver

# Inicialize o WebDriver (por exemplo, para o Chrome)
driver = webdriver.Chrome()

# URL da página onde está o combobox
url = "https://www.example.com"

try:
    # Abre a página
    driver.get(url)

    # Encontra o elemento do combobox pelo atributo 'name'
    combobox = driver.find_element_by_name("carteira")

    # Encontra todas as opções do combobox
    opcoes = combobox.find_elements_by_tag_name("option")

    # Laço de repetição para clicar em cada elemento do combobox
    for opcao in opcoes:
        # Obtém o valor e o texto de cada opção
        valor = opcao.get_attribute("value")
        texto = opcao.text

        # Clica na opção do combobox pelo texto da opção
        combobox.click()
        driver.find_element_by_xpath(f"//option[text()='{texto}']").click()

        # Continue a automação com a opção selecionada, por exemplo, clique em um botão, envie formulários, etc.
        # ...
        
        # Imprime o valor e o texto da opção atual (opcional)
        print(f"Valor: {valor}, Texto: {texto}")

    # Fechar o navegador após a automação (opcional)
    driver.quit()

except Exception as e:
    print(f"Erro: {e}")
    driver.quit()
