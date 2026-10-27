"""Example 4: handle a form and safely bind SQL query parameters."""
from flask import Blueprint, current_app, request
from db import get_connection
from html_utils import escape_html, format_currency, html_page

bp = Blueprint("example_emp_query", __name__)


@bp.get("/examples/EmpQuery")
def employee_query():
    employee_name = request.args.get("empname", "")
    department = request.args.get("deptnum", "")
    connection = None
    try:
        connection = get_connection("workson")
        query = "SELECT ename, salary, dno FROM emp WHERE 1=1"
        parameters = []
        if employee_name.strip():
            query += " AND ename LIKE ?"
            parameters.append(f"%{employee_name}%")
        if department.strip():
            query += " AND dno = ?"
            parameters.append(department)
        query += " ORDER BY ename"
        cursor = connection.cursor()
        cursor.execute(query, *parameters)
        rows = "".join(f"<tr><td>{escape_html(ename)}</td>"
                       f"<td>{format_currency(salary)}</td>"
                       f"<td>{escape_html(dno)}</td></tr>"
                       for ename, salary, dno in cursor.fetchall())
        return html_page("Employee Query Results", "<h1>Employee Search Results</h1>"
                         f"<p>SQL query: <code>{escape_html(query)}</code></p>"
                         '<table border="1"><tr><th>Name</th><th>Salary</th>'
                         '<th>Department</th></tr>' + rows + "</table>"
                         '<p><a href="/examples/sampleForm">New Search</a></p>')
    except Exception:
        current_app.logger.exception("Employee query example failed")
        return "Unable to query workson database. Check Docker logs.", 500
    finally:
        if connection is not None:
            connection.close()
