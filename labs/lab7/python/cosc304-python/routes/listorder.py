"""Question 1 (10 marks): list all orders and their ordered products."""

from flask import Blueprint, current_app
from db import get_connection
from html_utils import escape_html, format_currency, html_page

bp = Blueprint("listorder", __name__)


@bp.get("/listorder")
def list_orders():
    connection = None
    try:
        # TODO (Q1): Open the orders database with get_connection().
        # TODO: Query ordersummary and display each order's summary in a table.
        # TODO: For each order, query orderproduct joined to product to show items.
        #       Use SQL parameters with ? placeholders; e.g. cursor.execute(sql, order_id).
        # Use escape_html(text) for text and format_currency(value) for money.
        return html_page("YOUR NAME Grocery Order List",
                         "<h1>Order List</h1><p>TODO: implement Question 1.</p>")
    except Exception:
        # Log the actual error in the terminal; do not display credentials to users.
        current_app.logger.exception("Unable to list orders")
        return html_page("Order List Error", "<h1>Unable to retrieve orders.</h1>"), 500
    finally:
        # TODO (Q1): Close the connection if it was opened.
        # Example: if connection is not None: connection.close()
        pass
