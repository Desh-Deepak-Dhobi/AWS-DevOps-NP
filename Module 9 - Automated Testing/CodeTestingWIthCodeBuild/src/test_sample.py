import pytest

def check_location(content):
    if content == "I Love Nepal":
        return "Correct Location"
    else:
        return "Incorrect Location"

def test_file_content():
    with open("sample.txt", "r") as file:
        content = file.read().strip()
    
    assert check_location(content) == "Correct Location", "File content does not match expected text"
