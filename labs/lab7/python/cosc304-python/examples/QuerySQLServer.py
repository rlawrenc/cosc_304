"""Example 2: query SQL Server using pyodbc."""
from flask import Blueprint, current_app
from db import get_connection
from html_utils import escape_html, format_currency, html_page

bp = Blueprint("example_sql", __name__)


@bp.get("/examples/QuerySQLServer")
def query_sql_server():
    connection = None
    try:
        connection = get_connection("workson")
        cursor = connection.cursor()
        cursor.execute("SELECT ename, salary FROM emp")
        rows = "".join(f"<tr><td>{escape_html(row[0])}</td>"
                       f"<td>{format_currency(row[1])}</td></tr>"
                       for row in cursor.fetchall())
        return html_page("SQL Server Query", "<h1>Employees</h1>"
                         '<table border="1"><tr><th>Name</th><th>Salary</th></tr>'
                         + rows + '</table><p><a href="/examples">All Examples</a></p>')
    except Exception:
        current_app.logger.exception("Example SQL query failed")
        return "Unable to query workson database. Check Docker logs.", 500
    finally:
        if connection is not None:
            connection.close()
