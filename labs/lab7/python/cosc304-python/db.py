"""Shared SQL Server connection helper used by the store and examples."""

import os
import pyodbc


def get_connection(database="orders", *, autocommit=False):
    """Return a new pyodbc connection. The caller must close it.

    Inside Docker, the SQL Server host is cosc304_sqlserver (not localhost).
    The certificate is trusted for this local course database only.
    """
    host = os.getenv("DB_HOST", "cosc304_sqlserver")
    user = os.getenv("DB_USER", "sa")
    password = os.getenv("DB_PASSWORD", "304#sa#pw")
    # Keyword arguments avoid ODBC connection-string escaping issues.
    return pyodbc.connect(
        driver="ODBC Driver 18 for SQL Server",
        server=host,
        database=database,
        uid=user,
        pwd=password,
        Encrypt="yes",
        TrustServerCertificate="yes",
        timeout=10,
        autocommit=autocommit,
    )
