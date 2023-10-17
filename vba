import pyautogui
import time

# Espera até que a imagem apareça na tela (timeout de 10 segundos)
timeout = 10
start_time = time.time()

while time.time() - start_time < timeout:
    try:
        x, y = pyautogui.locateCenterOnScreen('caminho/para/imagem.png')
        break
    except Exception as e:
        pass

# Se a imagem foi encontrada, clique no botão
if 'x' in locals() and 'y' in locals():
    pyautogui.click(x, y)

    # Aguarde um momento antes de digitar algo (ajuste conforme necessário)
    time.sleep(1)

    # Digite algo no teclado
    pyautogui.write('Texto que você quer digitar')

else:
    print("Imagem não encontrada.")
