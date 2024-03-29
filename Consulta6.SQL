CREATE VIEW Consulta6 AS
SELECT T.NOMBRE AS NOMBRE_TOMADOR
FROM TOMADOR T

JOIN POLIZA P ON T.ID = P.IDTOMADOR

JOIN TIPO_CUBRIMIENTO TC ON P.IDTIPOCUBRIMIENTO = TC.ID

GROUP BY T.ID, T.NOMBRE

HAVING COUNT(DISTINCT TC.ID) = (SELECT COUNT(*) 
                                FROM TIPO_CUBRIMIENTO);

