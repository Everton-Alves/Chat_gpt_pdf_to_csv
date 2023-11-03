import os
import time
import shutil
from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.common.by import By

def fazer_download_renomear_e_mover(pasta_download, nome_novo_arquivo, pasta_destino):
    # Configurações do navegador
    opcoes = Options()
    opcoes.add_experimental_option("prefs", {
        "download.default_directory": pasta_download,
        "download.prompt_for_download": False,
        "download.directory_upgrade": True,
        "safebrowsing.enabled": True
    })

    # Inicializa o driver do Selenium
    service = Service('caminho_para_o_executável_do_chromedriver')
    driver = webdriver.Chrome(service=service, options=opcoes)

    # Abre a página com o botão de download
    driver.get('URL_DA_PÁGINA_COM_O_BOTÃO_DE_DOWNLOAD')

    # Localiza e clica no botão de download
    botao_download = driver.find_element(By.ID, 'ID_DO_BOTÃO_DE_DOWNLOAD')
    botao_download.click()

    # Espere um tempo suficiente para o download ser concluído (ajuste conforme necessário)
    time.sleep(10)

    # Lista todos os arquivos na pasta de download
    arquivos = os.listdir(pasta_download)

    # Verifica se há um novo arquivo na pasta de download
    for arquivo in arquivos:
        if arquivo.endswith('.pdf'):  # Verifica se o arquivo é um PDF (ou o formato desejado)
            # Renomeia o arquivo para o nome desejado
            novo_caminho = os.path.join(pasta_download, nome_novo_arquivo + '.pdf')
            os.rename(os.path.join(pasta_download, arquivo), novo_caminho)
            print(f'O arquivo foi baixado e renomeado para {novo_caminho}')
            
            # Move o arquivo para a pasta de destino
            destino = os.path.join(pasta_destino, nome_novo_arquivo + '.pdf')
            shutil.move(novo_caminho, destino)
            print(f'O arquivo foi movido para {destino}')
            break
    else:
        print('Nenhum arquivo foi baixado.')

    # Fecha o navegador
    driver.quit()

# Exemplo de uso da função
pasta_de_download = 'CAMINHO_PARA_A_PASTA_DE_DOWNLOAD'
nome_novo_arquivo = 'novo_nome_do_arquivo'
pasta_de_destino = 'CAMINHO_PARA_A_PASTA_DE_DESTINO'
fazer_download_renomear_e_mover(pasta_de_download, nome_novo_arquivo, pasta_de_destino)
