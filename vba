from selenium.common.exceptions import StaleElementReferenceException

def clicar_com_retry(element):
    tentativas = 3
    for _ in range(tentativas):
        try:
            element.click()
            break
        except StaleElementReferenceException:
            pass
