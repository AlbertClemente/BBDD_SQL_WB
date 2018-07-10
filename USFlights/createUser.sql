CREATE USER 'AlbertClemente'@'localhost' IDENTIFIED BY '123';
GRANT ALL PRIVILEGES ON USAirlineFlights.* TO 'AlbertClemente'@'localhost';

FLUSH PRIVILEGES;