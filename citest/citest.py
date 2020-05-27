from pyfiglet import Figlet

def get_message():
    return "Hello World"

def expand_message(m):
    f = Figlet()
    return f.renderText(m)

def main():
    print(expand_message(get_message()))
