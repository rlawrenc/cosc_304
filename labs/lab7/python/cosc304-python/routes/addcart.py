"""Provided route: add a product from the search results to the session cart."""

import re
from decimal import Decimal, InvalidOperation

from flask import Blueprint, redirect, request, session, url_for

bp = Blueprint("addcart", __name__)


@bp.get("/addcart")
def add_to_cart():
    product_id = request.args.get("id", "")
    name = request.args.get("name", "")
    raw_price = request.args.get("price", "")
    try:
        price = Decimal(raw_price)
        valid_price = price.is_finite() and 0 <= price <= 99999999.99
    except (InvalidOperation, ValueError):
        price, valid_price = None, False

    if not re.fullmatch(r"[1-9][0-9]{0,9}", product_id) or int(product_id) > 2147483647:
        return ('Invalid product information. <a href="/listprod">Return to products</a>', 400)
    if not name.strip() or not valid_price:
        return ('Invalid product information. <a href="/listprod">Return to products</a>', 400)

    # Flask stores the cart in a signed browser session cookie. Reassign the
    # mapping so Flask persists changes to nested session values.
    cart = dict(session.get("productList", {}))
    if product_id in cart:
        product = dict(cart[product_id])
        product["quantity"] = int(product["quantity"]) + 1
    else:
        product = {"id": product_id, "name": name, "price": float(price), "quantity": 1}
    cart[product_id] = product
    session["productList"] = cart
    return redirect(url_for("showcart.show_cart"))
