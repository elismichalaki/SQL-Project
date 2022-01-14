use DB39
-- 1 -- 
SELECT e.id_�������� , a.id_������� , e.���������� , e.����
FROM �������� as e, ������� as a
WHERE e.id_������� = a.id_�������; 

-- 2 --
SELECT �����, �������
FROM ���������
WHERE ���� = 'F' AND ������ > 30; 

-- 3 -- 
SELECT ek.�����, ek.�������, a.���������, e.����
FROM �������� as e
INNER JOIN ��������� as ek 
ON e.id = ek.id 
INNER JOIN ������� as a
ON e.id_������� = a.id_�������;

-- 4 -- 
UPDATE �������� SET ���� = 1.1 * ���� ;

-- 5 --
SELECT a.id_�������, a.���������
FROM ������� as a, ������� as p, �������� as e
WHERE a.id_������� = p.id_������� AND ����_�������� > 40000 AND e.���������� BETWEEN '2020-12-24' AND '2020-12-31' ;

-- 6 -- 
SELECT ek.id, ek.����, ek.������, 
		(SELECT COUNT(*)
		FROM �������� as e
		WHERE e.id = ek.id AND e.���������� LIKE '2020-%' ) as ����������
FROM ��������� as ek 
;

-- 7 --
SELECT id_�������
FROM ��������
GROUP BY id_�������, ����������
HAVING (COUNT(*) > 2 AND ���������� LIKE '2020-%'  ) ;

-- 8 -- 
SELECT DISTINCT (id_��������)
FROM ��������, ������� WHERE id_������� IN (SELECT id_������� 
         FROM �������
         WHERE ����_�������� > 25000) ;

-- 9 -- 
SELECT COUNT(*) as ����������
FROM ������� AS a
JOIN �������� AS e ON a.id_������� = e.id_�������
JOIN ������� AS p ON p.id_������� = a.id_�������
WHERE ���������� LIKE '2020-%' AND ��������� > 50000 ;

-- 10 -- 
SELECT COUNT(*) as ����������
FROM ������� AS a
JOIN �������� AS e ON a.id_������� = e.id_�������
JOIN ��������� AS ek ON ek.id = e.id
GROUP BY ek.����, a.id_�������

-- 11 --
SELECT id_�������,AVG(e.����/a.�������) as ����_���_�������
FROM ������� as a, �������� as e 
GROUP BY id_�������
ORDER BY ����_���_������� ASC ; 

-- 12 -- 
SELECT e.id, COUNT(g.���) as ����������_��������, COUNT (k.�������_����������) as ����������_���������
FROM �������� as e 
LEFT JOIN ������� as g ON e.id_������� = g.id_�������
LEFT JOIN �������� as K ON e.id_������� = k.id_�������
WHERE ���������� LIKE '2020-%'
GROUP BY id; 
 

--13--
CREATE VIEW ����_���_�������20(����_���_�������20) AS 
SELECT AVG(e.����/a.�������) as ����_���_�������20
FROM ������� as a, �������� as e 
WHERE ���������� LIKE '2020-%'
GROUP BY id_�������

CREATE VIEW ����_���_�������19(����_���_�������19) AS 
SELECT AVG(e.����/a.�������) as ����_���_�������19
FROM ������� as a, �������� as e 
WHERE ���������� LIKE '2019-%'
GROUP BY id_�������

SELECT ����_���_�������20 - ����_���_�������19, id_�������
FROM ����_���_�������20,����_���_�������19 ,�������
ORDER  BY  id_�������;

--14--
SELECT COUNT(id), id_�������
FROM ��������,������� 
GROUP BY id_�������
HAVING COUNT(*) >= 1 ; 

--15--
GO
CREATE VIEW V151 AS
SELECT p.id_�������, AVG(e.����/a.�������) AS AVG1960
FROM ������� as a,�������� as e,������� as p
WHERE a.id_�������=p.id_������� AND a.id_�������=e.id_������� AND year(e.����������)<1960
GROUP BY p.id_�������
GO
CREATE VIEW V152 AS
SELECT p.id_�������, AVG(e.����/a.�������) AS AVG1980
FROM ������� as a,�������� as e,������� as p
WHERE a.id_�������=p.id_������� AND a.id_�������=e.id_������� AND year(e.����������)>=1960 AND  year(e.����������)<1980
GROUP BY p.id_�������
GO
CREATE VIEW V153 AS
SELECT p.id_�������, AVG(e.����/a.�������) AS AVG2000
FROM ������� as a,�������� as e,������� as p
WHERE a.id_�������=p.id_������� AND a.id_�������=e.id_������� AND year(e.����������)>=1980 AND year(e.����������)<2000
GROUP BY p.id_�������
GO
CREATE VIEW V154 AS
SELECT p.id_�������, AVG(e.����/a.�������) AS AVG2021
FROM ������� as a,�������� as e,������� as p
WHERE a.id_�������=p.id_������� AND a.id_�������=e.id_������� AND year(e.����������)>=2000 AND year(e.����������)<2021
GROUP BY p.id_�������



SELECT p.id_�������, AVG1960, AVG1980, AVG2000, AVG2021
FROM ������� as p
LEFT JOIN V151 ON V151.id_������� = p.id_�������
LEFT JOIN V152 ON V152.id_������� = p.id_�������
LEFT JOIN V153 ON V153.id_������� = p.id_�������
LEFT JOIN V154 ON V154.id_������� = p.id_�������

--16-- 

SELECT COUNT(p.id_�������) * 100.0 / (SELECT COUNT(*) FROM ��������) as �������_���_������� , 
	   COUNT(p.���������) * 100.0 / (SELECT ��������� FROM ������� WHERE id_������� = 14104) as �������_���������
FROM �������� AS e
LEFT JOIN ������� AS a ON e.id_������� = a.id_�������
LEFT JOIN ������� AS p ON a.id_������� = p.id_������� 
WHERE ���������� LIKE'2020-%'
group by p.id_�������;
