import time
import os
from selenium import webdriver
from pySmartDL import SmartDL

# Inicialize o WebDriver (por exemplo, para o Chrome)
driver = webdriver.Chrome()

# URL da página onde está o botão de download
url = "https://www.example.com"

try:
    # Abre a página
    driver.get(url)

    # Localize o botão de download e clique nele
    botao_download = driver.find_element_by_id("botao_download_id")
    botao_download.click()

    # Aguarda o download ser iniciado (ajuste o tempo de espera conforme necessário)
    time.sleep(5)

    # Obtém o caminho do arquivo de download definido pelo navegador
    caminho_download = driver.execute_script("return window.navigator.userAgent")

    # Aguarda o download ser concluído
    # Apenas exemplo, o tempo de espera pode variar, e pode não ser a melhor abordagem em todos os casos
    while not caminho_download.endswith(".crdownload"):
        time.sleep(1)
        caminho_download = driver.execute_script("return window.navigator.userAgent")

    # Espera o download ser concluído usando pySmartDL
    destino_download = "/caminho/do/diretorio/de/destino/"  # Insira o caminho do diretório onde deseja salvar o arquivo baixado
    smart_dl = SmartDL(caminho_download, progress_bar=False, dest=destino_download)
    smart_dl.wait_for_finish()

    # Fechar o navegador após o download (opcional)
    driver.quit()

except Exception as e:
    print(f"Erro: {e}")
    driver.quit()
