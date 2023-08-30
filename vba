import cv2
import numpy as np

# Carregar a imagem alvo que você deseja procurar
imagem_alvo = cv2.imread('imagem_alvo.png')

# Carregar uma captura de tela (substitua 'screenshot.png' pelo caminho da sua captura de tela)
captura_de_tela = cv2.imread('screenshot.png')

# Encontrar as coordenadas da imagem alvo na captura de tela
resultado = cv2.matchTemplate(captura_de_tela, imagem_alvo, cv2.TM_CCOEFF_NORMED)
min_val, max_val, min_loc, max_loc = cv2.minMaxLoc(resultado)

# Extrair as coordenadas onde a imagem alvo foi encontrada
coordenadas_x, coordenadas_y = max_loc

print(f"Coordenadas (x, y) da imagem alvo: ({coordenadas_x}, {coordenadas_y})")
