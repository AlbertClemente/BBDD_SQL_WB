-- 1.Quantitat de registres de la taula de vols:
SELECT count(flightID) FROM usairlineflights.flights;

-- 2. Retard promig de sortida i arribada segons l’aeroport origen.
SELECT origin as 'Aeroport Origen', avg(ArrDelay) as 'Retard Arribada', avg(DepDelay) as 'Retard Sortida' FROM usairlineflights.flights group by origin;

/* 3. Retard promig d’arribada dels vols, per mesos i segons l’aeroport origen. A més,
	volen que els resultat es mostrin de la següent forma:
	LAX, 2000, 01, retard
	LAX, 2000, 02, retard
	…
	LAX, 2000, 12, retard
	LAX, 2001, 01, retard
	…
	ONT, 2000, 01, retard
	ONT, 2000, 02, retard
	etc.*/
    
SELECT origin as 'Aeroport Origen', colYear as 'Any', colMonth as 'Mes',  avg(ArrDelay) as 'Retard Arribada' FROM usairlineflights.flights group by origin;
