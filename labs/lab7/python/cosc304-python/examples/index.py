from flask import Blueprint
from html_utils import html_page

bp = Blueprint("example_index", __name__)


@bp.get("/examples")
@bp.get("/examples/")
def show_examples():
    return html_page("COSC 304 - Python Web Programming Examples", """
        <style>
            body { font-family: Arial, sans-serif; max-width: 900px; margin: 32px auto; padding: 0 20px; line-height: 1.5; color: #222; }
            h1 { margin-bottom: 0; }
            .intro { color: #555; margin-top: 5px; }
            section { margin: 28px 0; }
            h2 { border-bottom: 1px solid #ccc; padding-bottom: 6px; }
            li { margin: 8px 0; }
            small { color: #555; }
            a { color: #064b95; }
            a:hover { text-decoration: none; }
            code { background: #f3f3f3; padding: 1px 4px; }
        </style>

        <h1>COSC 304: Python Web Programming Examples</h1>
        <p class="intro">Examples of Python, Flask routes, HTML forms, and SQL Server queries.
            The database examples use the SQL Server <code>workson</code> database.</p>

        <section>
            <h2>1. Python and Flask Basics</h2>
            <ul>
                <li><a href="/examples/HelloWorld">Hello World</a> — Send a simple response from a Flask route.</li>
                <li><a href="/examples/HelloWorldAgain">Hello World Again</a> — Practice answer using a Python loop to generate HTML.</li>
            </ul>
        </section>

        <section>
            <h2>2. SQL Server Queries</h2>
            <ul>
                <li><a href="/examples/QuerySQLServer">Basic SQL Server query</a> — Execute a SQL query and display employee results in an HTML table.</li>
                <li><a href="/examples/WorksOnDeptEmpProj">Departments, projects, and employees</a> — Use parameterized queries to retrieve related records by department.</li>
            </ul>
        </section>

        <section>
            <h2>3. HTML Forms and Parameterized Queries</h2>
            <ul>
                <li><a href="/examples/sampleForm">Employee search</a> — Submit optional employee name and department filters to a Flask route.</li>
                <li><a href="/examples/WorksOnQuery">Employee/project search</a> — Join tables and search assignments using optional employee and project filters.</li>
            </ul>
        </section>

        <p><a href="/">Return to Store</a></p>
    """)
