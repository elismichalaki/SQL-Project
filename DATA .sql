use DB39
--���������--
INSERT INTO ���������(id,�����,�������,���������,����,������)
VALUES (1004, '�������', '������������','��������� 64','M', 45);

INSERT INTO ���������(id,�����,�������,���������,����,������)
VALUES (2306, '��������', '�����������','����� 82','M', 32);

INSERT INTO ���������(id,�����,�������,���������,����,������)
VALUES (6532, '������', '������������','���������� ������ 108�','F', 35);

INSERT INTO ���������(id,�����,�������,���������,����,������)
VALUES (3827, '�����', '�����','�������� 03','F', 50);

INSERT INTO ���������(id,�����,�������,���������,����,������)
VALUES (4829, '����', '�����','������� 80','F', 47);


--�������--
INSERT INTO ������� (id_�������,���������,������,�������,����_����������,id_�������)
VALUES (14099,'������� 77',5,92,1936,14099);

INSERT INTO ������� (id_�������,���������,������,�������,����_����������,id_�������)
VALUES (18456,'��������� 04',6,175,1968,14099);

INSERT INTO ������� (id_�������,���������,������,�������,����_����������,id_�������)
VALUES (22738,'�������� 45',0,90,1977,14102);

INSERT INTO ������� (id_�������,���������,������,�������,����_����������,id_�������)
VALUES (28573,'�������� 86',2,320,1984,14099)

INSERT INTO ������� (id_�������,���������,������,�������,����_����������,id_�������)
VALUES (22739,'�������� 45',1,90,1977,14102);


--�������--
INSERT INTO ������� (id_�������,���)
VALUES (28573,090528809);

INSERT INTO ������� (id_�������,���)
VALUES (22738,044223212);


--��������--
INSERT INTO ��������(id_�������,�������_����������,�����)
VALUES (14099,'��38492',4);

INSERT INTO ��������(id_�������,�������_����������,�����)
VALUES (18456,'��30498',2);

--������Ѻ�--
INSERT INTO ���������(��������,�����)
VALUES ('������',4)

INSERT INTO ���������(��������,�����)
VALUES ('������',2)

--��������--
INSERT INTO ��������(id_��������,����������,����,id,id_�������)
VALUES (948521,'2020-12-25',390000,1004,18456)

INSERT INTO ��������(id_��������,����������,����,id,id_�������)
VALUES (584983,'2020-4-2',850000,6532,14099)

INSERT INTO ��������(id_��������,����������,����,id,id_�������)
VALUES (485038,'2020-12-27',340000,3827,22738)

INSERT INTO ��������(id_��������,����������,����,id,id_�������)
VALUES (484738,'2021-11-11',380000,2306,22738)

INSERT INTO ��������(id_��������,����������,����,id,id_�������)
VALUES (182742,'2020-10-29',1500000,2306,22739)


--�������--
INSERT INTO �������(id_�������,��������,���������,����_��������,������)
VALUES (14099,'��������',52394,40000,14102);


INSERT INTO �������(id_�������,��������,���������,����_��������)
VALUES (14102,'������',4000000);


INSERT INTO �������(id_�������,��������,���������,����_��������, ������)
VALUES (14106,'�����',3000000,9100,14102);

--�������--
INSERT INTO �������(����������,��������,id)
VALUES ('16/11/2021',2,1004)

INSERT INTO �������(����������,��������,id)
VALUES ('5/11/2021',2,4829)

INSERT INTO �������(����������,��������,id)
VALUES ('2/11/2021',3,2306)

INSERT INTO �������(����������,��������,id)
VALUES ('20/11/2021',4,6532)

INSERT INTO �������(����������,��������,id)
VALUES ('20/11/2021',0.5,3827)

INSERT INTO �������(����������,��������,id)
VALUES ('16/11/2021',2,1004)

INSERT INTO �������(����������,��������,id)
VALUES ('18/11/2021',3,4829)

INSERT INTO �������(����������,��������,id)
VALUES ('21/11/2021',1,3827)

INSERT INTO �������(����������,��������,id)
VALUES ('24/11/2021',1,1004)

INSERT INTO �������(����������,��������,id)
VALUES ('15/11/2021',2,2306)

INSERT INTO �������(����������,��������,id)
VALUES ('16/11/2021',4,4829)