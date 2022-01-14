use DB39
-- 1 -- 
SELECT e.id_εκτίμηση , a.id_ακίνητο , e.ημερομηνία , e.τιμή
FROM Εκτίμηση as e, Ακίνητο as a
WHERE e.id_ακίνητο = a.id_ακίνητο; 

-- 2 --
SELECT όνομα, επίθετο
FROM Εκτιμητής
WHERE φύλο = 'F' AND ηλικία > 30; 

-- 3 -- 
SELECT ek.όνομα, ek.επίθετο, a.διεύθυνση, e.τιμή
FROM Εκτίμηση as e
INNER JOIN Εκτιμητής as ek 
ON e.id = ek.id 
INNER JOIN Ακίνητο as a
ON e.id_ακίνητο = a.id_ακίνητο;

-- 4 -- 
UPDATE Εκτίμηση SET τιμή = 1.1 * τιμή ;

-- 5 --
SELECT a.id_ακίνητο, a.διεύθυνση
FROM Ακίνητο as a, Περιοχή as p, Εκτίμηση as e
WHERE a.id_περιοχή = p.id_περιοχή AND μέσο_εισόδημα > 40000 AND e.ημερομηνία BETWEEN '2020-12-24' AND '2020-12-31' ;

-- 6 -- 
SELECT ek.id, ek.φύλο, ek.ηλικία, 
		(SELECT COUNT(*)
		FROM Εκτίμηση as e
		WHERE e.id = ek.id AND e.ημερομηνία LIKE '2020-%' ) as Εκτιμήσεις
FROM Εκτιμητής as ek 
;

-- 7 --
SELECT id_ακίνητο
FROM Εκτίμηση
GROUP BY id_ακίνητο, ημερομηνία
HAVING (COUNT(*) > 2 AND ημερομηνία LIKE '2020-%'  ) ;

-- 8 -- 
SELECT DISTINCT (id_εκτίμηση)
FROM Εκτίμηση, Περιοχή WHERE id_περιοχή IN (SELECT id_περιοχή 
         FROM Περιοχή
         WHERE μέσο_εισόδημα > 25000) ;

-- 9 -- 
SELECT COUNT(*) as Εκτιμήσεις
FROM Ακίνητο AS a
JOIN Εκτίμηση AS e ON a.id_ακίνητο = e.id_ακίνητο
JOIN Περιοχή AS p ON p.id_περιοχή = a.id_περιοχή
WHERE ημερομηνία LIKE '2020-%' AND πληθυσμός > 50000 ;

-- 10 -- 
SELECT COUNT(*) as Εκτιμήσεις
FROM Ακίνητο AS a
JOIN Εκτίμηση AS e ON a.id_ακίνητο = e.id_ακίνητο
JOIN Εκτιμητής AS ek ON ek.id = e.id
GROUP BY ek.φύλο, a.id_περιοχή

-- 11 --
SELECT id_περιοχή,AVG(e.τιμή/a.μέγεθος) as τιμή_ανά_μέγεθος
FROM Ακίνητο as a, Εκτίμηση as e 
GROUP BY id_περιοχή
ORDER BY τιμή_ανά_μέγεθος ASC ; 

-- 12 -- 
SELECT e.id, COUNT(g.ΑΦΜ) as Εκτιμήσεις_Γραφείων, COUNT (k.αριθμός_ταυτότητας) as Εκτιμήσεις_Κατοικιών
FROM Εκτίμηση as e 
LEFT JOIN Γραφείο as g ON e.id_ακίνητο = g.id_ακίνητο
LEFT JOIN Κατοικία as K ON e.id_ακίνητο = k.id_ακίνητο
WHERE ημερομηνία LIKE '2020-%'
GROUP BY id; 
 

--13--
CREATE VIEW τιμή_ανά_μέγεθος20(τιμή_ανά_μέγεθος20) AS 
SELECT AVG(e.τιμή/a.μέγεθος) as τιμή_ανά_μέγεθος20
FROM Ακίνητο as a, Εκτίμηση as e 
WHERE ημερομηνία LIKE '2020-%'
GROUP BY id_περιοχή

CREATE VIEW τιμή_ανά_μέγεθος19(τιμή_ανά_μέγεθος19) AS 
SELECT AVG(e.τιμή/a.μέγεθος) as τιμή_ανά_μέγεθος19
FROM Ακίνητο as a, Εκτίμηση as e 
WHERE ημερομηνία LIKE '2019-%'
GROUP BY id_περιοχή

SELECT τιμή_ανά_μέγεθος20 - τιμή_ανά_μέγεθος19, id_περιοχή
FROM τιμή_ανά_μέγεθος20,τιμή_ανά_μέγεθος19 ,Περιοχή
ORDER  BY  id_περιοχή;

--14--
SELECT COUNT(id), id_περιοχή
FROM Εκτίμηση,Περιοχή 
GROUP BY id_περιοχή
HAVING COUNT(*) >= 1 ; 

--15--
GO
CREATE VIEW V151 AS
SELECT p.id_περιοχή, AVG(e.τιμή/a.μέγεθος) AS AVG1960
FROM Ακίνητο as a,Εκτίμηση as e,Περιοχή as p
WHERE a.id_περιοχή=p.id_περιοχή AND a.id_ακίνητο=e.id_ακίνητο AND year(e.ημερομηνία)<1960
GROUP BY p.id_περιοχή
GO
CREATE VIEW V152 AS
SELECT p.id_περιοχή, AVG(e.τιμή/a.μέγεθος) AS AVG1980
FROM Ακίνητο as a,Εκτίμηση as e,Περιοχή as p
WHERE a.id_περιοχή=p.id_περιοχή AND a.id_ακίνητο=e.id_ακίνητο AND year(e.ημερομηνία)>=1960 AND  year(e.ημερομηνία)<1980
GROUP BY p.id_περιοχή
GO
CREATE VIEW V153 AS
SELECT p.id_περιοχή, AVG(e.τιμή/a.μέγεθος) AS AVG2000
FROM Ακίνητο as a,Εκτίμηση as e,Περιοχή as p
WHERE a.id_περιοχή=p.id_περιοχή AND a.id_ακίνητο=e.id_ακίνητο AND year(e.ημερομηνία)>=1980 AND year(e.ημερομηνία)<2000
GROUP BY p.id_περιοχή
GO
CREATE VIEW V154 AS
SELECT p.id_περιοχή, AVG(e.τιμή/a.μέγεθος) AS AVG2021
FROM Ακίνητο as a,Εκτίμηση as e,Περιοχή as p
WHERE a.id_περιοχή=p.id_περιοχή AND a.id_ακίνητο=e.id_ακίνητο AND year(e.ημερομηνία)>=2000 AND year(e.ημερομηνία)<2021
GROUP BY p.id_περιοχή



SELECT p.id_περιοχή, AVG1960, AVG1980, AVG2000, AVG2021
FROM Περιοχή as p
LEFT JOIN V151 ON V151.id_περιοχή = p.id_περιοχή
LEFT JOIN V152 ON V152.id_περιοχή = p.id_περιοχή
LEFT JOIN V153 ON V153.id_περιοχή = p.id_περιοχή
LEFT JOIN V154 ON V154.id_περιοχή = p.id_περιοχή

--16-- 

SELECT COUNT(p.id_περιοχή) * 100.0 / (SELECT COUNT(*) FROM Εκτίμηση) as Ποσοστό_ανά_περιοχή , 
	   COUNT(p.πληθυσμός) * 100.0 / (SELECT πληθυσμός FROM Περιοχή WHERE id_περιοχή = 14104) as Ποσοστό_πληθυσμού
FROM Εκτίμηση AS e
LEFT JOIN Ακίνητο AS a ON e.id_ακίνητο = a.id_ακίνητο
LEFT JOIN Περιοχή AS p ON a.id_περιοχή = p.id_περιοχή 
WHERE ημερομηνία LIKE'2020-%'
group by p.id_περιοχή;
