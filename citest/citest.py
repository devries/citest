"""
This is the main module in the citest package.
"""
from pyfiglet import Figlet

def get_message():
    """This function returns the standard message"""
    return "Hello World"

def expand_message(message):
    """This function takes a message and renders it in big ASCII text."""
    figlet = Figlet()
    return figlet.renderText(message)

def main():
    """This is the main function, used via the cit command line."""
    print(expand_message(get_message()))
