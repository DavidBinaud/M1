-- SET AUTOTRACE ON

-- Q2
-- SELECT nom
-- FROM ville
-- WHERE insee=1293;

-- SELECT nom
-- FROM ville
-- WHERE insee='1293';


-- Q3
-- ALTER TABLE ville add primary key(insee);


-- Q4
-- SELECT nom
-- FROM ville
-- WHERE insee=1293;

-- SELECT nom
-- FROM ville
-- WHERE insee='1293';


-- Q5
-- SELECT d.nom
-- FROM ville v
-- JOIN departement d ON v.dep = d.id 
-- WHERE insee='1293';


-- Q6
-- SELECT d.nom
-- FROM ville v
-- JOIN departement d ON v.dep = d.id;


-- Q7
-- SELECT /*+ use_nl(v d)*/ d.nom 
-- FROM ville v
-- JOIN departement d ON v.dep = d.id;


-- Q8
-- create index idx_dep_ville on ville (dep);
SELECT d.nom
FROM ville v
JOIN departement d ON v.dep = d.id 
WHERE insee='1293';

-- SELECT d.nom
-- FROM ville v
-- JOIN departement d ON v.dep = d.id;

-- Q9
-- SELECT v.nom, d.nom, r.nom
-- FROM ville v, departement d, region r
-- WHERE v.dep = d.id AND d.reg = r.id;