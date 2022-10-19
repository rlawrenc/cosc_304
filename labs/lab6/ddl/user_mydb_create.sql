CREATE DATABASE IF NOT EXISTS mydb;

USE mydb;
GRANT ALL privileges ON mydb.* TO testuser;

USE workson;
GRANT ALL privileges ON workson.* TO testuser;

USE university;
GRANT ALL privileges ON university.* TO testuser;

USE shipment;
GRANT ALL privileges ON shipment.* TO testuser;