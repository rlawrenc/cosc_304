"""Question 2 (10 marks): display/search products and provide cart links."""

from flask import Blueprint, request, current_app
from db import get_connection
from html_utils import escape_html, format_currency, html_page

bp = Blueprint("listprod", __name__)


@bp.get("/listprod")
def list_products():
    name = request.args.get("productName", "")
    form = ("<h1>Search for the products you want to buy:</h1>"
            '<form method="get" action="/listprod">'
            f'<input type="text" name="productName" size="50" value="{escape_html(name)}">'
            '<input type="submit" value="Submit"> '
            '<input type="reset" value="Reset"> '
            '(Leave blank for all products)</form>')

    connection = None
    try:
        # TODO (Q2): Open a connection with get_connection().
        # TODO: Query product; if name is not blank, use productName LIKE ?.
        #       Bind the search value as a parameter, e.g. f"%{name}%".
        #       If name is blank, return all products.
        # TODO: Display a table with product ID, name, and formatted price.
        # TODO: Each product needs a link to:
        #       /addcart?id=(productId)&name=(productName)&price=(productPrice)
        #       Use flask.url_for('addcart.add_to_cart', id=..., name=..., price=...)
        #       so special characters are URL-encoded correctly.
        # Use escape_html and format_currency when displaying values.
        return html_page("YOUR NAME Grocery", form +
                         "<p>TODO: implement product search for Question 2.</p>")
    except Exception:
        current_app.logger.exception("Unable to list products")
        return html_page("Product Search Error", form +
                         "<p>Unable to search products.</p>"), 500
    finally:
        # TODO (Q2): Close the connection if it was opened.
        pass
