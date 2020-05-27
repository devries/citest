from citest import get_message

def test_message():
    m = get_message()
    assert m == 'Goodbye World'
