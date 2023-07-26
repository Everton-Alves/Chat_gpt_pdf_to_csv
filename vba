from selenium import webdriver

# Inicialize o WebDriver (por exemplo, para o Chrome)
driver = webdriver.Chrome()

# URL da página onde está o combobox
url = "https://www.example.com"

try:
    # Abre a página
    driver.get(url)

    # Encontra o elemento do combobox
    combobox = driver.find_element_by_name("Carteira")

    # Encontra todos os elementos option dentro do combobox
    opcoes = combobox.find_elements_by_tag_name("option")

    # Número total de elementos no combobox
    numero_de_opcoes = len(opcoes)

    # Laço de repetição para interagir com cada elemento do combobox
    for i in range(numero_de_opcoes):
        # Clica na opção do combobox pelo índice
        opcoes[i].click()

        # Continue a automação com a opção selecionada, por exemplo, clique em um botão, envie formulários, etc.
        # ...
        
        # Imprime o valor e o texto da opção atual (opcional)
        valor = opcoes[i].get_attribute("value")
        texto = opcoes[i].text
        print(f"Opção {i+1}: Valor={valor}, Texto={texto}")

    # Fechar o navegador após a automação (opcional)
    driver.quit()

except Exception as e:
    print(f"Erro: {e}")
    driver.quit()
