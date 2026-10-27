"""Example 4: a basic GET form with two optional search fields."""
from flask import Blueprint
from html_utils import html_page

bp = Blueprint("example_sample_form", __name__)


@bp.get("/examples/sampleForm")
def sample_form():
    return html_page("Querying with Python and Forms", """
        <h1>Search by employee name and/or department</h1>
        <form method="get" action="/examples/EmpQuery">
          <label>Employee name: <input type="text" name="empname" size="25"></label>
          <label>Department: <input type="text" name="deptnum" size="5"></label>
          <input type="submit" value="Submit"><input type="reset" value="Reset">
        </form><p><a href="/examples">All Examples</a></p>""")
