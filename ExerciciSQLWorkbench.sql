-- 1.Quantitat de registres de la taula de vols:
SELECT count(flightID) FROM usairlineflights.flights;

-- 2. Retard promig de sortida i arribada segons l’aeroport origen.
SELECT origin as 'Aeroport Origen', avg(ArrDelay) as 'Retard Arribada', avg(DepDelay) as 'Retard Sortida' FROM usairlineflights.flights group by origin;
