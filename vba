import time
import pyautogui
from selenium import webdriver

# Configurar o driver do Selenium (no exemplo, estou usando o Chrome)
driver = webdriver.Chrome(executable_path='caminho_para_o_chromedriver.exe')

# Abrir a página da web
url = "URL_da_pagina"
driver.get(url)

# Esperar um pouco para que a página carregue completamente (ajuste conforme necessário)
time.sleep(5)

# Capturar uma captura de tela da página
screenshot_path = "screenshot.png"
driver.save_screenshot(screenshot_path)

# Encontrar as coordenadas da imagem (neste caso, você precisa saber as coordenadas manualmente)
image_coordinates = pyautogui.locateOnScreen('imagem_do_botao.png')
if image_coordinates:
    # Obter as coordenadas x e y do canto superior esquerdo da imagem
    x, y, _, _ = image_coordinates

    # Calcular as coordenadas do centro da imagem
    image_center_x = x + image_coordinates[2] // 2
    image_center_y = y + image_coordinates[3] // 2

    # Mover o cursor do mouse e clicar na imagem usando pyautogui
    pyautogui.moveTo(image_center_x, image_center_y)
    pyautogui.click()

# Fechar o navegador
driver.quit()
