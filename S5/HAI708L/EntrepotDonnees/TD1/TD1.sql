-- SELECT ID_PRODUIT, SUM(MONTANT_JOURNALIER)
-- FROM VENTES_MONOPRIX mp
-- GROUP BY ID_PRODUIT;

-- SELECT ID_PRODUIT, ID_VILLE, SUM(MONTANT_JOURNALIER)
-- FROM VENTES_MONOPRIX mp
-- GROUP BY ID_PRODUIT, ID_VILLE;

-- SELECT ID_PRODUIT, ID_DATE, SUM(MONTANT_JOURNALIER)
-- FROM VENTES_MONOPRIX mp
-- GROUP BY ID_PRODUIT, ID_DATE;

-- SELECT ID_MAGASIN, AVG(MONTANT_JOURNALIER)
-- FROM VENTES_MONOPRIX mp
-- GROUP BY ID_MAGASIN;

-- SELECT ID_VILLE, ID_DATE, SUM(MONTANT_JOURNALIER)
-- FROM VENTES_MONOPRIX mp
-- GROUP BY ID_VILLE, ID_DATE;

SELECT ID_PRODUIT, ID_VILLE, ID_DATE, MONTANT_JOURNALIER
FROM VENTES_MONOPRIX mp
GROUP BY ID_PRODUIT, ID_VILLE, ID_DATE;