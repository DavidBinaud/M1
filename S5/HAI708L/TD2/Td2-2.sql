-- SET AUTOTRACE ON

-- Q3

-- SELECT nom
-- FROM ville
-- WHERE insee=1293;

-- SELECT nom
-- FROM ville
-- WHERE insee='1293';

-- Q4
-- ALTER TABLE ville add primary key(insee);

-- SELECT d.nom
-- FROM ville v
-- JOIN departement d ON v.dep = d.id 
-- WHERE insee='1293';

-- SELECT d.nom
-- FROM ville v
-- JOIN departement d ON v.dep = d.id;

SELECT /*+ use_nl(v d)*/ d.nom 
FROM ville v
JOIN departement d ON v.dep = d.id;