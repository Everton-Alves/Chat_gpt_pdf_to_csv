from selenium import webdriver

# Inicialize o WebDriver (por exemplo, para o Chrome)
driver = webdriver.Chrome()

# URL da página onde está o elemento
url = "https://www.example.com"

try:
    # Abre a página
    driver.get(url)

    # Localiza o elemento com a classe "btn combinned  - shape" e tipo "submit" usando um seletor CSS
    elemento_btn = driver.find_element_by_css_selector('button.btn.combinned.-shape[type="submit"]')

    # Clica no elemento
    elemento_btn.click()

    # Fechar o navegador após o clique (opcional)
    driver.quit()

except Exception as e:
    print(f"Erro: {e}")
    driver.quit()
