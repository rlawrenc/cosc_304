"""Question 2 (20 marks): validate and save a completed order."""

from flask import Blueprint, request, session, current_app
from db import get_connection
from html_utils import escape_html, format_currency, html_page

bp = Blueprint("order", __name__)


@bp.post("/order")
def place_order():
    customer_id = request.form.get("customerId", "")
    products = list(session.get("productList", {}).values())
    connection = None

    try:
        # TODO (Q2): Validate that customer_id is a positive integer and exists
        #       in the customer table. Show an error if not valid.
        # TODO: Show an error if the products list is empty.
        # TODO: Open a connection to the orders database.
        # TODO: INSERT ordersummary with the customer ID and order date.
        #       Use a parameterized INSERT and return the generated orderId.
        #       In SQL Server, INSERT ... OUTPUT INSERTED.orderId ... works.
        # TODO: Loop through products; entries have id, name, price, quantity.
        #       INSERT each item into orderproduct, using ? placeholders.
        # TODO: UPDATE ordersummary.totalAmount for the order.
        #       Commit only when all statements succeed; roll back on failure.
        # TODO: Display order ID, purchased products, and total amount.
        # TODO: Clear session['productList'] only after the order is committed.
        # Use escape_html() for HTML text and format_currency() for prices.
        return html_page("YOUR NAME Grocery Order Processing",
                         "<h1>Order Processing</h1><p>TODO: implement Question 2.</p>")
    except Exception:
        current_app.logger.exception("Unable to process order")
        # TODO (Q2): Roll back any uncommitted inserts on a failure.
        return html_page("Order Processing Error",
                         "<h1>Unable to process the order.</h1>"), 500
    finally:
        # TODO (Q2): Close the connection if it was opened.
        pass
