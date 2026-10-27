"""Example 5 solution: employee/project query form."""
from flask import Blueprint
from html_utils import html_page

bp = Blueprint("example_workson_form", __name__)


@bp.get("/examples/WorksOnQuery")
def workson_form():
    return html_page("WorksOn Query Example", """
        <h1>Search for employee/project assignments</h1>
        <form method="get" action="/examples/EmpProjQuery">
          <label>Employee name: <input type="text" name="empname" size="25"></label>
          <label>Project name: <input type="text" name="projname" size="25"></label>
          <input type="submit" value="Submit"><input type="reset" value="Reset">
        </form><p><a href="/examples">All Examples</a></p>""")
