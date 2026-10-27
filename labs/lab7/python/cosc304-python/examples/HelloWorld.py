"""Example 1: the simplest Flask route."""
from flask import Blueprint

bp = Blueprint("hello_world", __name__)


@bp.get("/examples/HelloWorld")
def hello_world():
    return "<h1>Hello World</h1>"
