use DB39
CREATE TABLE Περιοχή
					(id_περιοχή INTEGER,
					ονομασία CHAR(20),
					πληθυσμός INTEGER,
					μέσο_εισόδημα INTEGER ,
					PRIMARY KEY(id_περιοχή),
					ανήκει int )
					 ;

CREATE TABLE Κατηγορία
					(τύπος CHAR(20),
					ονομασία CHAR(20)
					PRIMARY KEY (τύπος) )
				;

CREATE TABLE Ακίνητο
					(id_ακίνητο INTEGER,
					διεύθυνση CHAR(20),
					όροφος INTEGER,
					μέγεθος INTEGER,
					έτος_κατασκευής INTEGER,
					id_περιοχή INTEGER,
					FOREIGN KEY (id_περιοχή) REFERENCES Περιοχή,
					PRIMARY KEY(id_ακίνητο))
					;

CREATE TABLE Εκτιμητής
					   (id INTEGER,
						όνομα CHAR(50),
						επίθετο CHAR(50),
						διεύθυνση CHAR(50),
						φύλο CHAR(10),
						ηλικία INTEGER
						PRIMARY KEY (id));
CREATE TABLE Εκτίμηση
					(id_εκτίμηση INTEGER,
					ημερομηνία DATE,
					τιμή INTEGER,
					id_ακίνητο INTEGER,
					id INTEGER,
					FOREIGN KEY (id_ακίνητο) REFERENCES Ακίνητο,
					FOREIGN KEY (id) REFERENCES Εκτιμητής,
					PRIMARY KEY(id_εκτίμηση));

CREATE TABLE Σύνδεση 
					(ημερομηνία CHAR(20),
					διάρκεια INTEGER,
					id INTEGER not null,
					FOREIGN KEY (id) REFERENCES Εκτιμητής);



CREATE TABLE  Κατοικία
					(id_ακίνητο INTEGER,
					τύπος CHAR(20),
					αριθμός_ταυτότητας CHAR(20),
					FOREIGN KEY (id_ακίνητο) REFERENCES Ακίνητο,
					FOREIGN KEY (τύπος) REFERENCES Κατηγορία);
CREATE TABLE Γραφείο
					(id_ακίνητο INTEGER,
					ΑΦΜ INTEGER,
					FOREIGN KEY (id_ακίνητο) REFERENCES Ακίνητο);



					
					


						
