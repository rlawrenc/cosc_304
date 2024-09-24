CREATE DATABASE IF NOT EXISTS mydb;

USE mydb;

USE workson;
GRANT ALL privileges ON workson.* TO testuser;


USE university;
GRANT ALL privileges ON university.* TO testuser;
