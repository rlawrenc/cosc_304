"""Example 3 solution: departments, each with their projects and employees."""
from flask import Blueprint, current_app
from db import get_connection
from html_utils import escape_html, format_currency, html_page

bp = Blueprint("example_dept_proj_emp", __name__)


@bp.get("/examples/WorksOnDeptEmpProj")
def departments_projects_employees():
    connection = None
    try:
        connection = get_connection("workson")
        cursor = connection.cursor()
        departments = cursor.execute(
            "SELECT dno, dname FROM dept ORDER BY dno").fetchall()
        output = ["<h1>Projects and Employees by Department</h1>"]
        for dept_no, dept_name in departments:
            output.append(f"<h2>{escape_html(dept_no)}: "
                          f"{escape_html(dept_name)}</h2>")
            projects = cursor.execute(
                "SELECT pno, pname, budget FROM proj WHERE dno = ? ORDER BY pno",
                dept_no).fetchall()
            output.append("<h3>Projects</h3>")
            if not projects:
                output.append("<p>No projects.</p>")
            else:
                output.append('<table border="1"><tr><th>Number</th>'
                              '<th>Name</th><th>Budget</th></tr>')
                for pno, pname, budget in projects:
                    output.append(f"<tr><td>{escape_html(pno)}</td>"
                                  f"<td>{escape_html(pname)}</td>"
                                  f"<td>{format_currency(budget)}</td></tr>")
                output.append("</table>")

            employees = cursor.execute(
                "SELECT eno, ename, bdate, salary FROM emp WHERE dno = ? ORDER BY eno",
                dept_no).fetchall()
            output.append("<h3>Employees</h3>")
            if not employees:
                output.append("<p>No employees.</p>")
            else:
                output.append('<table border="1"><tr><th>Number</th>'
                              '<th>Name</th><th>Birth Date</th><th>Salary</th></tr>')
                for eno, ename, bdate, salary in employees:
                    date_text = bdate.strftime("%Y-%m-%d") if bdate else ""
                    output.append(f"<tr><td>{escape_html(eno)}</td>"
                                  f"<td>{escape_html(ename)}</td>"
                                  f"<td>{escape_html(date_text)}</td>"
                                  f"<td>{format_currency(salary)}</td></tr>")
                output.append("</table>")
        output.append('<p><a href="/examples">All Examples</a></p>')
        return html_page("Departments, Projects, and Employees", "".join(output))
    except Exception:
        current_app.logger.exception("Department example query failed")
        return "Unable to query workson database. Check Docker logs.", 500
    finally:
        if connection is not None:
            connection.close()
