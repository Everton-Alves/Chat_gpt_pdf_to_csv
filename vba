import pyautogui
import time

def move_mouse_left_and_right(duration, interval):
    start_time = time.time()
    end_time = start_time + duration

    while time.time() < end_time:
        # Mover para a direita
        pyautogui.moveRel(50, 0, duration=0.25)

        # Mover para a esquerda
        pyautogui.moveRel(-50, 0, duration=0.25)

        # Aguardar o intervalo de tempo
        time.sleep(interval)

if __name__ == "__main__":
    # Definir a duração total em segundos (exemplo: 1 hora = 3600 segundos)
    duration_seconds = 3600

    # Definir o intervalo de tempo em segundos (exemplo: 5 segundos)
    interval_seconds = 5

    move_mouse_left_and_right(duration_seconds, interval_seconds)
