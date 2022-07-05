/*

Pregunta
===========================================================================

Realice una consulta que compute la cantidad de veces que aparece cada valor 
de la columna `t0.c5`  por año.

Apache Hive se ejecutará en modo local (sin HDFS).

Escriba el resultado a la carpeta `output` de directorio de trabajo.

*/
DROP TABLE IF EXISTS tbl0;
CREATE TABLE tbl0 (
    c1 INT,
    c2 STRING,
    c3 INT,
    c4 DATE,
    c5 ARRAY<CHAR(1)>, 
    c6 MAP<STRING, INT>
)
ROW FORMAT DELIMITED 
FIELDS TERMINATED BY ','
COLLECTION ITEMS TERMINATED BY ':'
MAP KEYS TERMINATED BY '#'
LINES TERMINATED BY '\n';
LOAD DATA LOCAL INPATH 'data0.csv' INTO TABLE tbl0;

DROP TABLE IF EXISTS tbl1;
CREATE TABLE tbl1 (
    c1 INT,
    c2 INT,
    c3 STRING,
    c4 MAP<STRING, INT>
)
ROW FORMAT DELIMITED 
FIELDS TERMINATED BY ','
COLLECTION ITEMS TERMINATED BY ':'
MAP KEYS TERMINATED BY '#'
LINES TERMINATED BY '\n';
LOAD DATA LOCAL INPATH 'data1.csv' INTO TABLE tbl1;

/*
    >>> Escriba su respuesta a partir de este punto <<<
*/

CREATE TABLE tabla  (
    c1 INT,
    c2 STRING,
    c3 INT,
    c4 DATE,
    c5 ARRAY<CHAR(1)>,
    c6 MAP<STRING, INT>)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
COLLECTION ITEMS TERMINATED BY ':'
MAP KEYS TERMINATED BY '#' LINES TERMINATED BY '\n';

LOAD DATA LOCAL INPATH 'data0.csv' INTO TABLE Tabla;

CREATE tabla2 AUX AS
SELECT
    YEAR(c4) pt4, pt0
FROM
    TP_5
LATERAL VIEW
    EXPLODE(c5) pt01 as pt0;

INSERT OVERWRITE LOCAL DIRECTORY './output'
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','

SELECT
    pt4, pt0, COUNT(1) Cant
FROM
    tabla2
GROUP BY
    pt4, pt0
ORDER BY
    pt4, pt0;
