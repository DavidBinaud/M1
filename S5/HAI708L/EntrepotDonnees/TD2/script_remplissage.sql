/* Liste des Dates */

INSERT INTO dateTable(dateKey, dateValue) VALUES (1, TO_DATE('02/10/2022', 'dd/mm/yyyy'));
INSERT INTO dateTable(dateKey, dateValue) VALUES (2, TO_DATE('03/10/2022', 'dd/mm/yyyy'));
INSERT INTO dateTable(dateKey, dateValue) VALUES (3, TO_DATE('04/10/2022', 'dd/mm/yyyy'));
INSERT INTO dateTable(dateKey, dateValue) VALUES (0, TO_DATE('01/10/2022', 'dd/mm/yyyy'));
INSERT INTO dateTable(dateKey, dateValue) VALUES (4, TO_DATE('05/10/2022', 'dd/mm/yyyy'));
INSERT INTO dateTable(dateKey, dateValue) VALUES (5, TO_DATE('06/10/2022', 'dd/mm/yyyy'));
INSERT INTO dateTable(dateKey, dateValue) VALUES (6, TO_DATE('07/10/2022', 'dd/mm/yyyy'));
INSERT INTO dateTable(dateKey, dateValue) VALUES (7, TO_DATE('08/10/2022', 'dd/mm/yyyy'));
INSERT INTO dateTable(dateKey, dateValue) VALUES (8, TO_DATE('09/10/2022', 'dd/mm/yyyy'));
INSERT INTO dateTable(dateKey, dateValue) VALUES (9, TO_DATE('10/10/2022', 'dd/mm/yyyy'));
INSERT INTO dateTable(dateKey, dateValue) VALUES (10, TO_DATE('11/10/2022', 'dd/mm/yyyy'));


/* Liste des Times */
INSERT INTO timeTable(timeKey, timeValue) VALUES (0, TO_TIMESTAMP('01/01/1960 07:00:00', 'dd/mm/yyyy hh:mi:ss'));
INSERT INTO timeTable(timeKey, timeValue) VALUES (1, TO_TIMESTAMP('01/01/1960 08:00:00', 'dd/mm/yyyy hh:mi:ss'));
INSERT INTO timeTable(timeKey, timeValue) VALUES (2, TO_TIMESTAMP('01/01/1960 09:00:00', 'dd/mm/yyyy hh:mi:ss'));
INSERT INTO timeTable(timeKey, timeValue) VALUES (3, TO_TIMESTAMP('01/01/1960 10:00:00', 'dd/mm/yyyy hh:mi:ss'));
INSERT INTO timeTable(timeKey, timeValue) VALUES (4, TO_TIMESTAMP('01/01/1960 11:00:00', 'dd/mm/yyyy hh:mi:ss'));
INSERT INTO timeTable(timeKey, timeValue) VALUES (5, TO_TIMESTAMP('01/01/1960 12:00:00', 'dd/mm/yyyy hh:mi:ss'));
INSERT INTO timeTable(timeKey, timeValue) VALUES (6, TO_TIMESTAMP('01/01/1960 01:00:00', 'dd/mm/yyyy hh:mi:ss'));
INSERT INTO timeTable(timeKey, timeValue) VALUES (7, TO_TIMESTAMP('01/01/1960 02:00:00', 'dd/mm/yyyy hh:mi:ss'));
INSERT INTO timeTable(timeKey, timeValue) VALUES (8, TO_TIMESTAMP('01/01/1960 03:00:00', 'dd/mm/yyyy hh:mi:ss'));
INSERT INTO timeTable(timeKey, timeValue) VALUES (9, TO_TIMESTAMP('01/01/1960 04:00:00', 'dd/mm/yyyy hh:mi:ss'));


/* Liste des Places */
INSERT INTO place(placeKey, city, country) VALUES (0, 'Paris', 'France');
INSERT INTO place(placeKey, city, country) VALUES (1, 'Lyon', 'France');
INSERT INTO place(placeKey, city, country) VALUES (2, 'Montpellier', 'France');
INSERT INTO place(placeKey, city, country) VALUES (3, 'Toulouse', 'France');
INSERT INTO place(placeKey, city, country) VALUES (4, 'Marseille', 'France');
INSERT INTO place(placeKey, city, country) VALUES (5, 'Angouleme', 'France');
INSERT INTO place(placeKey, city, country) VALUES (6, 'Bordeaux', 'France');
INSERT INTO place(placeKey, city, country) VALUES (7, 'Londres', 'Royaume-Uni');
INSERT INTO place(placeKey, city, country) VALUES (8, 'Berlin', 'Allemagne');


/* Liste des Models */
INSERT INTO model(modelKey, modelName, creator) VALUES (0,'Nikon 3100', 'Eiji Fumio');
INSERT INTO model(modelKey, modelName, creator) VALUES (1,'Nikon 3200', 'Eiji Fumio');
INSERT INTO model(modelKey, modelName, creator) VALUES (2,'Nikon 3300', 'Eiji Fumio');
INSERT INTO model(modelKey, modelName, creator) VALUES (3,'Nikon D900', 'FujiMato');
INSERT INTO model(modelKey, modelName, creator) VALUES (4,'Canon G1', 'Paolo Jao');
INSERT INTO model(modelKey, modelName, creator) VALUES (5,'Canon G2', 'Paolo Jao');
INSERT INTO model(modelKey, modelName, creator) VALUES (6,'Canon E1', 'Pierre Destin');
INSERT INTO model(modelKey, modelName, creator) VALUES (7,'Canon J8', 'Pierre Destin');

/* Liste des lignées */
INSERT INTO lignageModel(modelKey, modelKeyDerivedFrom, modelHierarchy, bottomFlag, topFlag) VALUES (0, 0, 0, 0, 1);
INSERT INTO lignageModel(modelKey, modelKeyDerivedFrom, modelHierarchy, bottomFlag, topFlag) VALUES (1, 1, 0, 0, 0);
INSERT INTO lignageModel(modelKey, modelKeyDerivedFrom, modelHierarchy, bottomFlag, topFlag) VALUES (1, 0, 1, 0, 0);
INSERT INTO lignageModel(modelKey, modelKeyDerivedFrom, modelHierarchy, bottomFlag, topFlag) VALUES (2, 2, 0, 0, 0);
INSERT INTO lignageModel(modelKey, modelKeyDerivedFrom, modelHierarchy, bottomFlag, topFlag) VALUES (2, 1, 1, 1, 0);
INSERT INTO lignageModel(modelKey, modelKeyDerivedFrom, modelHierarchy, bottomFlag, topFlag) VALUES (2, 0, 2, 1, 0);
INSERT INTO lignageModel(modelKey, modelKeyDerivedFrom, modelHierarchy, bottomFlag, topFlag) VALUES (3, 3, 0, 0, 1);
INSERT INTO lignageModel(modelKey, modelKeyDerivedFrom, modelHierarchy, bottomFlag, topFlag) VALUES (4, 4, 0, 0, 1);
INSERT INTO lignageModel(modelKey, modelKeyDerivedFrom, modelHierarchy, bottomFlag, topFlag) VALUES (5, 5, 0, 0, 0);
INSERT INTO lignageModel(modelKey, modelKeyDerivedFrom, modelHierarchy, bottomFlag, topFlag) VALUES (5, 4, 1, 1, 0);
INSERT INTO lignageModel(modelKey, modelKeyDerivedFrom, modelHierarchy, bottomFlag, topFlag) VALUES (6, 6, 0, 0, 1);
INSERT INTO lignageModel(modelKey, modelKeyDerivedFrom, modelHierarchy, bottomFlag, topFlag) VALUES (7, 7, 0, 0, 1);


/* Liste des photos */
INSERT INTO photo(dateKey, timeKey, placeKey, modelKey) VALUES (0, 0, 0, 0);
INSERT INTO photo(dateKey, timeKey, placeKey, modelKey) VALUES (1, 1, 5, 0);
INSERT INTO photo(dateKey, timeKey, placeKey, modelKey) VALUES (1, 5, 4, 3);
INSERT INTO photo(dateKey, timeKey, placeKey, modelKey) VALUES (2, 1, 5, 1);
INSERT INTO photo(dateKey, timeKey, placeKey, modelKey) VALUES (2, 1, 4, 2);
INSERT INTO photo(dateKey, timeKey, placeKey, modelKey) VALUES (1, 1, 1, 4);
INSERT INTO photo(dateKey, timeKey, placeKey, modelKey) VALUES (1, 3, 2, 1);
INSERT INTO photo(dateKey, timeKey, placeKey, modelKey) VALUES (4, 4, 3, 6);
INSERT INTO photo(dateKey, timeKey, placeKey, modelKey) VALUES (7, 1, 1, 7);
INSERT INTO photo(dateKey, timeKey, placeKey, modelKey) VALUES (8, 1, 4, 7);
INSERT INTO photo(dateKey, timeKey, placeKey, modelKey) VALUES (9, 2, 2, 6);
