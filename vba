import cv2
import numpy as np
from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.options import Options

def screenshot_and_compare(screenshot_path, template_path):
    # Configurar o Selenium para capturar um screenshot
    chrome_options = Options()
    chrome_options.add_argument("--headless")  # Execução em modo headless
    service = Service('/path/to/chromedriver')  # Substitua pelo caminho do chromedriver
    driver = webdriver.Chrome(service=service, options=chrome_options)
    driver.get('URL_DO_SEU_SITE_AQUI')  # Substitua pela URL do site
    
    # Capturar o screenshot
    driver.save_screenshot(screenshot_path)
    driver.quit()
    
    # Carregar as imagens
    screenshot = cv2.imread(screenshot_path, cv2.IMREAD_COLOR)
    template = cv2.imread(template_path, cv2.IMREAD_COLOR)
    
    # Tentar encontrar a imagem de template na screenshot
    result = cv2.matchTemplate(screenshot, template, cv2.TM_CCOEFF_NORMED)
    _, _, _, max_loc = cv2.minMaxLoc(result)
    
    # Definir um limite de similaridade (ajuste conforme necessário)
    similarity_threshold = 0.8
    
    if np.max(result) >= similarity_threshold:
        print("Imagem encontrada na screenshot!")
        # Executar ação aqui (por exemplo, clicar em um elemento)
        # ...

# Substitua pelos caminhos reais das imagens
screenshot_path = "screenshot.png"
template_path = "template.png"

screenshot_and_compare(screenshot_path, template_path)
