import cv2
import numpy as np

# Carregar a imagem que você deseja verificar
imagem_alvo = cv2.imread('caminho/para/sua/imagem.png')

# Função para verificar se a imagem alvo foi encontrada em uma captura de tela
def verificar_imagem_na_tela(imagem_alvo):
    screenshot = cv2.imread('screenshot.png')  # Captura de tela capturada previamente
    resultado = cv2.matchTemplate(screenshot, imagem_alvo, cv2.TM_CCOEFF_NORMED)
    threshold = 0.8  # Ajuste este valor conforme necessário

    loc = np.where(resultado >= threshold)
    if len(loc[0]) > 0:
        return True
    else:
        return False

# Verificar se a imagem alvo foi exibida na captura de tela
imagem_exibida = verificar_imagem_na_tela(imagem_alvo)

if imagem_exibida:
    print("A imagem foi exibida na tela.")
else:
    print("A imagem não foi encontrada na tela.")
