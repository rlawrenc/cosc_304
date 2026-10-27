"""Check database status and optionally restore the initial store data."""

import re
from pathlib import Path

from flask import Blueprint, current_app, request
from db import get_connection
from html_utils import html_page

bp = Blueprint("loaddata", __name__)


def get_counts():
    connection = get_connection()
    try:
        cursor = connection.cursor()
        cursor.execute("""SELECT
            (SELECT COUNT(*) FROM customer) AS customers,
            (SELECT COUNT(*) FROM product) AS products,
            (SELECT COUNT(*) FROM ordersummary) AS orders""")
        return cursor.fetchone()
    finally:
        connection.close()


def render_status(message="", counts=None):
    if counts is None:
        summary = ("<p>Unable to access the store database. "
                   "Check Docker and SQL Server logs.</p>")
    else:
        summary = ("<h3>Database connection successful.</h3>"
                   f"<p>Customers: {counts[0]}</p><p>Products: {counts[1]}</p>"
                   f"<p>Orders: {counts[2]}</p>")
    return html_page("COSC 304 Database Setup", f"""
        <h2>COSC 304 Store Database</h2>{message}{summary}<hr>
        <h3>Reset Database</h3>
        <p>Resetting deletes orders, customers, products, and other changes,
        and restores the original sample data.</p>
        <form method="post" action="/loaddata"
          onsubmit="return confirm('Reset database and delete existing data?');">
          <input type="submit" value="Reset Database"></form>
        <p><a href="/">Return to Store</a></p>""")


@bp.get("/loaddata")
def check_database():
    try:
        return render_status(counts=get_counts())
    except Exception:
        current_app.logger.exception("Store database check failed")
        return render_status(), 503


@bp.post("/loaddata")
def reset_database():
    connection = None
    try:
        script = (Path(__file__).resolve().parent.parent / "ddl" /
                  "SQLServer_orderdb.ddl").read_text(encoding="utf-8-sig")
        # SQL Server's GO is a client-side batch separator, not T-SQL itself.
        batches = [s.strip() for s in re.split(r"^\s*GO\s*$", script,
                                              flags=re.IGNORECASE | re.MULTILINE)
                   if s.strip()]
        connection = get_connection("master", autocommit=True)
        cursor = connection.cursor()
        for batch in batches:
            cursor.execute(batch)
            # Consume informational row counts and later result sets, if any.
            while cursor.nextset():
                pass
        connection.close()
        connection = None
        return render_status("<p><strong>Database reset completed successfully.</strong></p>",
                             get_counts())
    except Exception:
        current_app.logger.exception("Store database reset failed")
        return render_status("<p><strong>Database reset failed.</strong> "
                             "Check server logs.</p>"), 500
    finally:
        if connection is not None:
            connection.close()
