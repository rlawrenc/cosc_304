"""Example 5 solution: filter assignments using employee and project names."""
from flask import Blueprint, current_app, request
from db import get_connection
from html_utils import escape_html, html_page

bp = Blueprint("example_emp_proj_query", __name__)


@bp.get("/examples/EmpProjQuery")
def employee_project_query():
    employee_name = request.args.get("empname", "")
    project_name = request.args.get("projname", "")
    connection = None
    try:
        connection = get_connection("workson")
        query = ("SELECT E.eno, E.ename, P.pno, P.pname, W.resp, W.hours "
                 "FROM emp E JOIN workson W ON E.eno = W.eno "
                 "JOIN proj P ON P.pno = W.pno WHERE 1=1")
        parameters = []
        if employee_name.strip():
            query += " AND E.ename LIKE ?"
            parameters.append(f"%{employee_name}%")
        if project_name.strip():
            query += " AND P.pname LIKE ?"
            parameters.append(f"%{project_name}%")
        query += " ORDER BY E.ename, P.pname"
        cursor = connection.cursor()
        cursor.execute(query, *parameters)
        results = cursor.fetchall()
        rows = "".join("<tr>" + "".join(f"<td>{escape_html(value)}</td>"
                                        for value in record) + "</tr>"
                       for record in results)
        return html_page("Employee/Project Query Results",
                         "<h1>Employee/Project Assignments</h1>"
                         f"<p>SQL query: <code>{escape_html(query)}</code></p>"
                         '<table border="1"><tr><th>Employee #</th><th>Employee</th>'
                         '<th>Project #</th><th>Project</th><th>Responsibility</th>'
                         '<th>Hours</th></tr>' + rows + '</table>'
                         f"<p>Number of records: {len(results)}</p>"
                         '<p><a href="/examples/WorksOnQuery">New Search</a></p>')
    except Exception:
        current_app.logger.exception("Employee/project query example failed")
        return "Unable to query workson database. Check Docker logs.", 500
    finally:
        if connection is not None:
            connection.close()
