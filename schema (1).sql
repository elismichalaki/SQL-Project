use DB39
CREATE TABLE �������
					(id_������� INTEGER,
					�������� CHAR(20),
					��������� INTEGER,
					����_�������� INTEGER ,
					PRIMARY KEY(id_�������),
					������ int )
					 ;

CREATE TABLE ���������
					(����� CHAR(20),
					�������� CHAR(20)
					PRIMARY KEY (�����) )
				;

CREATE TABLE �������
					(id_������� INTEGER,
					��������� CHAR(20),
					������ INTEGER,
					������� INTEGER,
					����_���������� INTEGER,
					id_������� INTEGER,
					FOREIGN KEY (id_�������) REFERENCES �������,
					PRIMARY KEY(id_�������))
					;

CREATE TABLE ���������
					   (id INTEGER,
						����� CHAR(50),
						������� CHAR(50),
						��������� CHAR(50),
						���� CHAR(10),
						������ INTEGER
						PRIMARY KEY (id));
CREATE TABLE ��������
					(id_�������� INTEGER,
					���������� DATE,
					���� INTEGER,
					id_������� INTEGER,
					id INTEGER,
					FOREIGN KEY (id_�������) REFERENCES �������,
					FOREIGN KEY (id) REFERENCES ���������,
					PRIMARY KEY(id_��������));

CREATE TABLE ������� 
					(���������� CHAR(20),
					�������� INTEGER,
					id INTEGER not null,
					FOREIGN KEY (id) REFERENCES ���������);



CREATE TABLE  ��������
					(id_������� INTEGER,
					����� CHAR(20),
					�������_���������� CHAR(20),
					FOREIGN KEY (id_�������) REFERENCES �������,
					FOREIGN KEY (�����) REFERENCES ���������);
CREATE TABLE �������
					(id_������� INTEGER,
					��� INTEGER,
					FOREIGN KEY (id_�������) REFERENCES �������);



					
					


						
