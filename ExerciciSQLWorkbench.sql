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

/* 4. Retard promig d’arribada dels vols, per mesos i segons l’aeroport origen (mateixa
	consulta que abans i amb el mateix ordre). Però a més, ara volen que en comptes
	del codi de l’aeroport es mostri el nom de la ciutat.
	Los Angeles, 2000, 01, retard
	Los Angeles, 2000, 02, retard
*/

SELECT airport as 'Aeroport Origen', colYear as 'Any', colMonth as 'Mes',  avg(ArrDelay) as 'Retard Arribada' FROM usairlineflights.usairports INNER JOIN usairlineflights.flights ON usairports.IATA = flights.flightID GROUP BY airport;

/*  5. Les companyies amb més vols cancelats. A més, han d’estar ordenades de forma
que les companyies amb més cancelacions apareguin les primeres */

SELECT description as 'Nom companyia aèria', count(cancelled) as 'Vols Cancel·lats' FROM usairlineflights.carriers INNER JOIN usairlineflights.flights ON carriers.CarrierCode = flights.UniqueCarrier group by Description HAVING COUNT('Vols Cancel·lats') >= 1 order by 'Vols Cancel·lats' desc;