from selenium import webdriver
from selenium.webdriver.support.ui import Select

# Inicialize o WebDriver (por exemplo, para o Chrome)
driver = webdriver.Chrome()

# URL da página onde está o combobox
url = "https://www.example.com"

try:
    # Abre a página
    driver.get(url)

    # Localize o elemento combobox
    combobox = driver.find_element_by_id("combobox_id")

    # Crie um objeto Select para interagir com o combobox
    select_combobox = Select(combobox)

    # Obtenha a lista de opções do combobox
    lista_opcoes = select_combobox.options

    # Crie um loop para interagir com cada elemento do combobox
    for opcao in lista_opcoes:
        # Selecione cada opção do combobox
        select_combobox.select_by_value(opcao.get_attribute("value"))

        # Continue a automação com a opção selecionada
        # Por exemplo, localize e interaja com outros elementos na página após selecionar a opção do combobox
        outro_elemento = driver.find_element_by_xpath("//seu/xpath/here")
        outro_elemento.click()

    # Fechar o navegador após a automação (opcional)
    driver.quit()

except Exception as e:
    print(f"Erro: {e}")
    driver.quit()
