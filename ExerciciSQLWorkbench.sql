-- 1.Quantitat de registres de la taula de vols:
SELECT count(flightID) FROM usairlineflights.flights;

-- 2. Retard promig de sortida i arribada segons l’aeroport origen.
SELECT avg(ArrDelay) FROM usairlineflights.flights;
SELECT avg(DepDelay) FROM usairlineflights.flights;