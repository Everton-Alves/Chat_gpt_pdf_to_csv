import pyautogui

def encontrar_coordenadas_botao():
    print("Posicione o mouse sobre o botão e aguarde alguns segundos...")
    time.sleep(5)
    x, y = pyautogui.position()
    print(f"Coordenadas do botão: x={x}, y={y}")

if __name__ == "__main__":
    encontrar_coordenadas_botao()
