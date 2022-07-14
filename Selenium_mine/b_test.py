from selenium import webdriver
print("hello")
options1 = webdriver.ChromeOptions() 
prefs = {
"download.default_directory": r"C:\Users\XXXX\downdir\stamp"
}

options1.add_experimental_option("prefs", prefs)

driver = webdriver.Chrome(options=options1,executable_path="C:\Components\chromedriver.exe")