"""Provided route: prompt for customer ID and submit checkout to /order."""

from flask import Blueprint
from html_utils import html_page

bp = Blueprint("checkout", __name__)


@bp.get("/checkout")
def checkout():
    return html_page("Grocery Store Checkout", """
        <h1>Checkout</h1>
        <p>Enter your customer ID to complete the transaction:</p>
        <form method="post" action="/order">
            <label for="customerId">Customer ID:</label>
            <input type="text" id="customerId" name="customerId" required>
            <input type="submit" value="Place Order">
        </form>
        <p><a href="/showcart">Return to Shopping Cart</a></p>""")
