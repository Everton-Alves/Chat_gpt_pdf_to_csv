from pynput.mouse import Listener

def on_click(x, y, button, pressed):
    if pressed:
        print(f'Coordenada X: {x}, Coordenada Y: {y}')

# Iniciar o listener do mouse
with Listener(on_click=on_click) as listener:
    listener.join()
