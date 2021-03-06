-- 1.Quantitat de registres de la taula de vols:
SELECT count(flightID)
FROM usairlineflights.flights;

-- 2. Retard promig de sortida i arribada segons l’aeroport origen.
SELECT origin as 'Aeroport Origen', avg(ArrDelay) as 'Retard Arribada', avg(DepDelay) as 'Retard Sortida' 
FROM usairlineflights.flights 
group by 'Aeroport Origen';

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
    
SELECT origin as 'Aeroport Origen', colYear as 'Any', colMonth as 'Mes',  avg(ArrDelay) as 'Retard Arribada'
FROM usairlineflights.flights 
group by 'Aeroport Origen', 'Any', 'Mes'
order by 'Aeroport Origen', 'Any', 'Mes' asc;

/* 4. Retard promig d’arribada dels vols, per mesos i segons l’aeroport origen (mateixa
	consulta que abans i amb el mateix ordre). Però a més, ara volen que en comptes
	del codi de l’aeroport es mostri el nom de la ciutat.
	Los Angeles, 2000, 01, retard
	Los Angeles, 2000, 02, retard
*/

SELECT airport as 'Aeroport Origen', colYear as 'Any', colMonth as 'Mes',  avg(ArrDelay) as 'Retard Arribada'
FROM usairlineflights.usairports 
INNER JOIN usairlineflights.flights 
ON usairports.IATA = flights.flightID 
group by 'Aeroport Origen', 'Any', 'Mes'
order by 'Aeroport Origen', 'Any', 'Mes' asc;

/*  5. Les companyies amb més vols cancelats. A més, han d’estar ordenades de forma
que les companyies amb més cancelacions apareguin les primeres */

SELECT description as 'Nom companyia aèria', count(cancelled) as 'Vols Cancel·lats' 
FROM usairlineflights.flights
INNER JOIN usairlineflights.carriers  
ON carriers.CarrierCode = flights.UniqueCarrier 
where cancelled = 1
group by description 
order by 'Vols Cancel·lats' desc;

/*  6. L’identificador dels 10 avions que més kilòmetres han recorregut fent vols
comercials: */

SELECT TailNum as 'Avió', sum(distance) as 'Distància' 
from usairlineflights.flights 
group by TailNum 
order by Distància 
DESC LIMIT 10;

/*  7. Companyies amb el seu retard promig només d’aquelles les quals els seus vols
arriben al seu destí amb un retràs promig major de 10 minuts. */

/*SELECT description as 'Nom companyia aèria', avg(ArrDelay) as 'Retard Arribada'
FROM usairlineflights.flights
INNER JOIN usairlineflights.carriers
ON carriers.CarrierCode = flights.UniqueCarrier
WHERE 'Retard Arribada' > 10
group by description;*/

SELECT Description as 'Companyia', avg(ArrDelay) as 'Retard'
FROM usairlineflights.flights
LEFT JOIN usairlineflights.carriers
ON flights.UniqueCarrier = carriers.CarrierCode
group by Companyia
HAVING Retard > 10

