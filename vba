import time
import pyautogui

def encontrar_imagem(imagem):
    try:
        local_imagem = pyautogui.locateOnScreen(imagem)
        return local_imagem
    except Exception as e:
        return None

def clicar_no_botao(x, y):
    pyautogui.click(x, y)

def baixar_arquivo():
    # Implemente aqui a lógica para baixar o arquivo após clicar no botão de download.
    print("Arquivo baixado com sucesso!")

def automatizar_rotina(executavel, imagem_botao, pos_botao_download):
    pyautogui.PAUSE = 1  # Atraso de 1 segundo entre as ações (ajuste conforme necessário).
    
    # Executar o executável (substitua "caminho/do/executavel" pelo caminho correto).
    # Exemplo: subprocess.Popen("caminho/do/executavel")

    while True:
        local_imagem = encontrar_imagem(imagem_botao)
        if local_imagem:
            print("Botão encontrado!")
            x, y = pyautogui.center(local_imagem)
            clicar_no_botao(x, y)
            baixar_arquivo()
            break
        else:
            print("Aguardando o botão...")
            time.sleep(2)  # Esperar 2 segundos antes de verificar novamente.

if __name__ == "__main__":
    executavel = "caminho/do/executavel"  # Substitua pelo caminho correto do executável.
    imagem_botao = "caminho/da/imagem/do-botao.png"  # Substitua pelo caminho da imagem do botão.
    pos_botao_download = (x, y)  # Substitua pelas coordenadas (x, y) do botão de download.

    automatizar_rotina(executavel, imagem_botao, pos_botao_download)
