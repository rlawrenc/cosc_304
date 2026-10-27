"""Small HTML helpers. Full template engines are not required for this lab."""

from decimal import Decimal
from html import escape


def escape_html(value):
    return escape("" if value is None else str(value), quote=True)


def format_currency(value):
    return f"${Decimal(str(value)):.2f}"


def html_page(title, body):
    return ("<!DOCTYPE html><html lang='en'><head><meta charset='utf-8'>"
            f"<title>{escape_html(title)}</title></head><body>{body}</body></html>")
