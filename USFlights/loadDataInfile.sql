use USAirlineFlights;
TRUNCATE TABLE flights;

/*SHOW VARIABLES LIKE 'secure_file_priv';*/

LOAD DATA INFILE 'C:\Users\formacio\Desktop\data\500X2000.csv'
INTO TABLE flights 
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(colYear, colMonth, DayOfMonths, DayOfWeek, DepTime, CRSDepTime, ArrTime, CRSArrTime, UniqueCarrier, FlightNum, TailNum, ActualElapsedTime, CRSElapsedTime, AirTime, ArrDelay, DepDelay, Origin, Dest, Distance, TaxiIn, TaxiOut, Cancelled, CancellationCode, Diverted);