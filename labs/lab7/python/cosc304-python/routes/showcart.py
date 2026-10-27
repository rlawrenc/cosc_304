"""Provided route: display the current session's shopping cart."""

from decimal import Decimal
from flask import Blueprint, session
from html_utils import escape_html, format_currency, html_page

bp = Blueprint("showcart", __name__)


@bp.get("/showcart")
def show_cart():
    products = list(session.get("productList", {}).values())
    if not products:
        return html_page("Your Shopping Cart", "<h1>Your shopping cart is empty!</h1>"
                         '<p><a href="/listprod">Continue Shopping</a></p>')

    total = Decimal("0.00")
    rows = []
    for product in products:
        subtotal = Decimal(str(product["price"])) * int(product["quantity"])
        total += subtotal
        rows.append(f"<tr><td>{escape_html(product['id'])}</td>"
                    f"<td>{escape_html(product['name'])}</td>"
                    f"<td>{int(product['quantity'])}</td>"
                    f"<td>{format_currency(product['price'])}</td>"
                    f"<td>{format_currency(subtotal)}</td></tr>")

    return html_page("Your Shopping Cart", "<h1>Your Shopping Cart</h1>"
                     '<table border="1"><tr><th>Product ID</th><th>Product Name</th>'
                     '<th>Quantity</th><th>Price</th><th>Subtotal</th></tr>'
                     + "".join(rows)
                     + '<tr><td colspan="4"><strong>Order Total</strong></td>'
                     + f"<td>{format_currency(total)}</td></tr></table>"
                     + '<h2><a href="/checkout">Check Out</a></h2>'
                     + '<p><a href="/listprod">Continue Shopping</a></p>')
