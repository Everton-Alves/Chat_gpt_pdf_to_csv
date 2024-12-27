from selenium.webdriver.common.by import By
from selenium.common.exceptions import NoSuchElementException

def clicar_botao_editar(driver, numero_conta, nome_banco):
    """
    Procura uma linha em uma tabela HTML com base no número da conta e nome do banco,
    e clica no botão de edição com a classe 'icon-edit'.

    :param driver: WebDriver do Selenium já configurado e com a página carregada.
    :param numero_conta: Número da conta que será buscado.
    :param nome_banco: Nome do banco que será buscado.
    :return: None
    """
    try:
        # Verifique se a tabela está presente na página
        tabela = driver.find_element(By.TAG_NAME, "table")

        # Percorra todas as linhas da tabela
        linhas = tabela.find_elements(By.TAG_NAME, "tr")
        for linha in linhas:
            # Obtenha todas as colunas (células) da linha
            colunas = linha.find_elements(By.TAG_NAME, "td")

            # Certifique-se de que a linha tem pelo menos duas colunas
            if len(colunas) >= 2:
                # Verifique se os valores de número da conta e nome do banco correspondem
                if numero_conta in colunas[0].text and nome_banco in colunas[1].text:
                    print(f"Linha encontrada: Conta {numero_conta}, Banco {nome_banco}")
                    
                    # Clique no botão de edição (classe "icon-edit") dentro dessa linha
                    try:
                        botao_editar = linha.find_element(By.CLASS_NAME, "icon-edit")
                        botao_editar.click()
                        print("Botão 'Editar' clicado com sucesso!")
                        return  # Sai da função após clicar no botão
                    except NoSuchElementException:
                        print("Botão 'Editar' não encontrado nesta linha.")
                        return

        print("Nenhuma linha correspondente foi encontrada na tabela.")

    except NoSuchElementException:
        print("Tabela não encontrada na página.")
