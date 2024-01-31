import pyautogui
import time

def clicar_com_base_na_imagem(imagem_path, confianca=0.8):
    try:
        # Obter as coordenadas da imagem na tela
        localizacao = pyautogui.locateOnScreen(imagem_path, confidence=confianca)

        if localizacao is not None:
            # Obter as coordenadas do centro da imagem
            centro_x, centro_y = pyautogui.center(localizacao)
            
            # Clicar no centro da imagem
            pyautogui.click(centro_x, centro_y)
            print(f"Imagem encontrada e clicada nas coordenadas: ({centro_x}, {centro_y})")
            return True
        else:
            print("Imagem não encontrada na tela.")
            return False

    except Exception as e:
        print(f"Erro ao tentar clicar na imagem: {e}")
        return False

# Substitua 'caminho/para/sua/imagem.png' pelo caminho real da sua imagem
caminho_da_imagem = 'caminho/para/sua/imagem.png'

# Aguarde um tempo antes de executar o script para garantir que a página esteja totalmente carregada
time.sleep(5)

# Tente clicar na imagem
clicar_com_base_na_imagem(caminho_da_imagem)
