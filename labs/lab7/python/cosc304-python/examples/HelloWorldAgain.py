"""Solution to Example 1: HTML output from a Python loop."""
from flask import Blueprint
from html_utils import html_page

bp = Blueprint("hello_world_again", __name__)


@bp.get("/examples/HelloWorldAgain")
def hello_world_again():
    numbers = "\n".join(str(number) for number in range(1, 6))
    return html_page("Hello World in Python",
                     f"<h1>Hello World Again!</h1><pre>{numbers}</pre>")
