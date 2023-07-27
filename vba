import pyautogui
import time

def move_mouse_zigzag(num_loops, width, height):
    # Configurar a velocidade de movimento do mouse (opcional)
    pyautogui.FAILSAFE = True
    pyautogui.PAUSE = 0.5  # Tempo de pausa entre cada movimento (ajuste conforme necessário)

    for _ in range(num_loops):
        # Movimento horizontal para a direita
        for x in range(width):
            pyautogui.moveTo(x, pyautogui.position().y, duration=0.1)
        
        # Movimento vertical para baixo
        for y in range(height):
            pyautogui.moveTo(pyautogui.position().x, y, duration=0.1)
        
        # Movimento horizontal para a esquerda
        for x in range(width, 0, -1):
            pyautogui.moveTo(x, pyautogui.position().y, duration=0.1)

        # Movimento vertical para cima
        for y in range(height, 0, -1):
            pyautogui.moveTo(pyautogui.position().x, y, duration=0.1)

# Configuração das dimensões da tela
largura_da_tela = 800
altura_da_tela = 600

# Defina o número de vezes que deseja repetir o zig zag
numero_de_loops = 3

try:
    time.sleep(2)  # Aguardar 2 segundos antes de começar (tempo para posicionar o mouse na janela desejada)
    move_mouse_zigzag(numero_de_loops, largura_da_tela, altura_da_tela)
except KeyboardInterrupt:
    print("\nExecução interrompida pelo usuário.")
