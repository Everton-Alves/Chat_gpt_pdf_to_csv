from selenium import webdriver
import pyautogui
import cv2
import numpy as np
import time

# Configuração do Selenium
chrome_options = webdriver.ChromeOptions()
chrome_options.add_argument("--start-maximized")  # Maximiza a janela do Chrome
driver = webdriver.Chrome(executable_path="caminho/para/chromedriver", options=chrome_options)
driver.get("URL_da_página_a_ser_aberta")  # Substitua pela URL correta

# Espera um tempo para a página carregar completamente
time.sleep(5)

# Capturar a tela do Chrome usando o Selenium
screenshot_path = "screenshot_chrome.png"
driver.save_screenshot(screenshot_path)

# Carregar a imagem que você deseja procurar
imagem_alvo = cv2.imread('imagem_alvo.png')

# Carregar a captura de tela do Chrome
tela_chrome = cv2.imread(screenshot_path)

# Encontrar as coordenadas da imagem alvo na tela do Chrome
resultado = cv2.matchTemplate(tela_chrome, imagem_alvo, cv2.TM_CCOEFF_NORMED)
min_val, max_val, min_loc, max_loc = cv2.minMaxLoc(resultado)

# Obter as coordenadas da correspondência mais forte
x, y = max_loc

# Clicar nas coordenadas encontradas usando o PyAutoGUI
pyautogui.click(x, y)

# Fechar o navegador do Selenium
driver.quit()
