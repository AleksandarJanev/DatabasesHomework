USE HW_Karavan_4228

GO
CREATE PROCEDURE A_1 @id_jazik NUMERIC
AS
SELECT slika, opisslika, id_galerija
FROM Galerija_Slika AS GS INNER JOIN Galerija AS G
ON G.id_galerija=GS.gal_id_galerijas
INNER JOIN Galerija_Opis AS GOP
ON G.id_galerija=GOP.gal_id_galerija
INNER JOIN Jazik AS J
ON GOP.jazik_id_jazikg=J.id_jazik
WHERE @id_jazik=J.id_jazik
GO

EXEC A_1 4

----------------------------------------------

GO
CREATE PROCEDURE A_2 @id_administrator NUMERIC
AS
SELECT jazik, ime
FROM Kadministrator AS KA INNER JOIN Knovost KN
ON KA.id_admin=KN.adm_id_admin
INNER JOIN Jazik AS J
ON KN.jazik_id_jazik=J.id_jazik
WHERE @id_administrator=KA.id_admin
GO

EXEC A_2 5

----------------------------------------------

GO
CREATE PROCEDURE A_3
AS
SELECT naziv, ime
FROM Email AS E INNER JOIN Mailing AS M
ON E.id_posetitel=M.email_id_posetitel
INNER JOIN Email_Grupa AS EG
ON M.email_id_grupa=EG.id_grupa
GO

EXEC A_3

----------------------------------------------

GO
CREATE PROCEDURE A_4
AS
SELECT naslov, tekst, aktivna
FROM Email_Poraka AS EP INNER JOIN Email_Grupa AS EG
ON EP.grupa_id_grupa=EG.id_grupa
WHERE EG.aktivna='1'
GO

EXEC A_4