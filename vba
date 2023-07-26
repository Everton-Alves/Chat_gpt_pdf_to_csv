from selenium import webdriver
from selenium.webdriver.support.ui import Select

driver = webdriver.Chrome()
driver.get("https://www.example.com/")

# Find the combobox
combobox = driver.find_element_by_id("combobox")

# Get the number of elements in the combobox
num_elements = len(combobox.find_elements_by_tag_name("option"))

# Iterate over the elements in the combobox
for i in range(num_elements):
    # Click on the element
    combobox.find_element_by_xpath("//option[%d]" % i).click()

driver.quit()
