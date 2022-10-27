SELECT modelKey, COUNT(*) as "Number of photos"
FROM photo
GROUP BY modelKey;



SELECT COUNT(*) as "Photos for Eiji Fumio models"
FROM photo p, model m
WHERE p.modelKey = m.modelKey AND m.creator = 'Eiji Fumio';

SELECT p.modelKey, m.modelName, COUNT(*) as "Number of photos"
FROM photo p, model m
WHERE p.modelKey = m.modelKey
GROUP BY p.modelKey, m.modelName;


SELECT *
FROM lignageModel;


SELECT lm.modelKeyDerivedFrom, m.modelName, COUNT(*) AS "Number of Photos"
FROM lignageModel lm, photo p, model m
WHERE p.modelKey = lm.modelKey AND lm.modelKeyDerivedFrom IN
				(SELECT modelKey
				FROM lignageModel
				WHERE topFlag = 1)
AND lm.modelKeyDerivedFrom = m.modelKey
GROUP BY lm.modelKeyDerivedFrom, m.modelName;