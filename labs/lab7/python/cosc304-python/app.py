"""COSC 304 Lab 7 store and examples, served by Flask."""

import os
from pathlib import Path

from flask import Flask, send_file

from routes import addcart, checkout, listorder, listprod, loaddata, order, showcart
from examples import register_examples

app = Flask(__name__)
# Local student-development setting; use a random secret stored outside code in production.
app.secret_key = os.getenv("FLASK_SECRET_KEY", "cosc304-local-lab-session-secret")


@app.get("/")
def index():
    return send_file(Path(__file__).parent / "views" / "index.html")


for module in (loaddata, listorder, listprod, addcart, showcart, checkout, order):
    app.register_blueprint(module.bp)
register_examples(app)

if __name__ == "__main__":
    # Reloader picks up student edits; debugger deliberately disabled.
    app.run(host="0.0.0.0", port=5000, debug=False, use_reloader=True)
