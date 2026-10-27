# Local teaching environment: Flask, Python, ODBC Driver 18, SQL Server.
FROM python:3.12-slim-bookworm

WORKDIR /app

# Install the Microsoft SQL Server ODBC driver for pyodbc (Debian 12).
RUN apt-get update && apt-get install -y --no-install-recommends \
        ca-certificates curl unixodbc && \
    curl -fsSL https://packages.microsoft.com/config/debian/12/packages-microsoft-prod.deb \
        -o /tmp/packages-microsoft-prod.deb && \
    dpkg -i /tmp/packages-microsoft-prod.deb && \
    rm /tmp/packages-microsoft-prod.deb && \
    apt-get update && \
    ACCEPT_EULA=Y apt-get install -y --no-install-recommends msodbcsql18 && \
    rm -rf /var/lib/apt/lists/*

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
COPY . .

CMD ["python", "app.py"]
