 create database[Gestion Note]
go
use [Gestion Note]
go
create table Role (
                 ID_Role int  NOT NULL IDENTITY(1,1) primary key ,
				 Role nvarchar(255)
  );
  create table Utulisateur(
                ID_Utulisateur int  NOT NULL IDENTITY(1,1) primary key,
				Nom_Utulisateur  nvarchar(255),
				Prenom_Utulisateur nvarchar(255),
				Logine nvarchar(255),
				Mot_de_passe nvarchar(255),
				ID_Role int foreign key references Role( ID_Role)                  
  );
  create table Departement (
               Code_Departement int  NOT NULL IDENTITY(1,1) primary key ,
			   Nom_Departement nvarchar(255),
			   ID_Utulisateur int foreign key references Utulisateur(ID_Utulisateur)
  );
  create table Filiere (
               Code_Filiere int  NOT NULL IDENTITY(1,1) primary key,
			   Nom_Filiere nvarchar(255),
			   Code_Departement int foreign key references Departement( Code_Departement)
  );
  create table Semestre (
               ID_Semestre int  NOT NULL IDENTITY(1,1) primary key,
			   Value varchar(255)
		    
  );
  create table Module (
               ID_Module int  NOT NULL IDENTITY(1,1) primary key ,
			   Nom_Module nvarchar(255),
			   Coiffission int,
			   Code_Filiere int foreign key  references Filiere (Code_Filiere),
			   ID_Semestre int foreign key references Semestre(ID_Semestre)
  );
   create table Statuss (
                ID_Status int  NOT NULL IDENTITY(1,1) primary key,
				Nom_Status nvarchar(255)

   );
  create table Result (
               ID_Result int  NOT NULL IDENTITY(1,1) primary key,
			   Note_Result float,
			   ID_Utulisateur int foreign key references Utulisateur(ID_Utulisateur),
			   ID_Module int foreign key references Module(ID_Module),
			   ID_Status int foreign key references  Statuss (ID_Status)           
  );
  create table Message(
               ID_Message int  NOT NULL IDENTITY(1,1) primary key,
			   Message_Afficher nvarchar(255)
   );
  create table Notification(
               ID_Notification int  NOT NULL IDENTITY(1,1) primary key,
			   ID_Message int foreign key references Message(ID_Message),
			   ID_Module int foreign key references Module(ID_Module),
			   ID_Utulisateur int foreign key references Utulisateur(ID_Utulisateur)
  );

  ----------------------------------------------------------------------------------
  insert into Role values
                        ('Administrateur'),
                        ('Formateur'),
						('Stagiaire');
  insert into Utulisateur values
                             ('Atid','Laila','AtidLaila@gmail.com','Atid123',1),
                             ('Naim','Ahmed','NaimAhmed@gmail.com','Naim123',2),
						     ('Bnkhnata','Morad','BnkhnataMorad@gmail.com','Bnkhnata123',2),
						     ('Amri','Laila','AmriLaila@gmail.com','Amri123',2),
							 ('Essamkaoui','Ettibari','Ettibariessamkaoui@gmail.com','Essamkaoui123',2),
							 ('Hamza','Samira','HamzaSamira@gmail.com','Hamza123',2),
							 ('Elghaouat','Mohamed','ElghaouatMohamed@gmail.com','Elghaouat123',2),
                             ('Ouabtar','Rachida','Ouabtar@gmail.com','ouabtar123',3),
						     ('Khalfat','Chaimae','Khalfat@gmail.com','khalfat123',3),
						     ('Afzi','Basma','Afzi@gmail.com','afzi123',3),
							 ('Khoubi','Zineb','Khoubi@gmail.com','Khoubi123',3),
							 ('Hakkioui','Hamza','Hakkioui@gmail.com','Hakkioui123',3),
							 ('Elmansourni','Haitam','Elmansourni@gmail.com','Elmansourni123',3),
							 ('Borassi','Souhail','Borassi@gmail.com','Borassi123',3),
                             ('Abid','Sanae','Abid@gmail.com','Abid123',3),
							 ('Elhaouzi','Fouzia','Elhaouzi@gmail.com','Elhaouzi123',3),
							 ('Ediani','Malika','Ediani@gmail.com','Ediani123',3),
							 ('Essmaili','Hassna','Essmaili@gmail.com','Essmaili123',3),
							 ('Hamdis','Aya','Hamdis@gmail.com','Hamdis123',3),
							 ('youssfi','youssra','youssfi@gmail.com','youssfi123',3),
							 ('Elkhouziri','Amin','Elkhouziri@gmail.com','Elkhouziri123',3),
							 ('Mofakir','Hassan','Mofakir@gmail.com','Mofakir123',3),
							 ('Firachin','Zakaria','Firachin@gmail.com','Firachin123',3),
							 ('Missi','Abdeljabbar','Missi@gmail.com','Missi123',3),
							 ('Hakimi','Abderrazak','Hakimi@gmail.com','Hakimi123',3),
							 ('Eddarkaoui','Achraf','Eddarkaoui@gmail.com','Eddarkaoui123',3),
							 ('Elouzi','Soufiane','Elouzi@gmail.com','Elouzi123',3),
							 ('Dazia','Abdelbbarre','Dazia@gmail.com','Dazia123',3),
							 ('Houiss','Karima','Houiss@gmail.com','Houiss123',3),
							 ('Montasir','Jaafar','Montasir@gmail.com','Montasir123',3),
							 ('Ejjabri','Mohamed','Ejjabri@gmail.com','Ejjabri123',3),
							 ('Essajai','Hassan','Essajai@gmail.com','Essajai123',3);

/*						
    insert into Departement values
	                         ('Departement Informatique',1),
							 ('Departement Informatique',2),
							 ('Departementt Informatique',3),
						     ('Departement Informatique',4),
							 ('Departement Informatique',5),
						     ('Departement Informatique',6),
							 ('Departement Communication',7),
							 ('Departement Communication',8),
							 ('Departement Communication',9),
							 ('Departement Communication',10),
   insert into Filiere values  
                                   ('Technique de Devloppement Informatique',201),
									('Tout les filieres',202);

							
    insert into Semestre values
	                             (101,'Semestre 1'),
								 (102,'Semestre 2');
   
     insert into Module values
	                              (10001,'Communication ecrite et orale',2,77,'Semestre 1'),
								  (10002,'Anglais technique',2,77,'Semestre 1'),
								  (10003,'Soft Skills',2,77,'Semestre 2'),
								  (10004,'Bases de données',2,77,'Semestre 1'),
								  (10005,'Devloppement d application client/serveur',3,77,'Semestre 1'),
								  (10006,'Devloppement web coté client',3,77,'Semestre 1'),
								  (10007,'Devloppement web coté serveur',3,77,'Semestre 2'),
								  (10008,'Devloppement d application mobiles',3,77,'Semestre 2'),
								  (10009,'Culture d entreprenariat',1,77,'Semestre 2'),
								  (10010,'Stage en entreprise',2,77,'Semestre 1'),
								  (10011,'Projet de fin de formation',2,77,'Semestre 2');
								  

      insert into Statuss values
	                               (100,'Admis'),
								   (101,'Racheté'),
								   (102,'Eliminer');

      
	   insert into Result  values
	                               */








    select *from  Role
    select *from  Utulisateur
    select *from  Departement
    select *from  Filiere
    select *from  Semestre
    select *from  Module 
	select *from  Statuss
	select *from  Result 
    select *from  Message
    select *from  Notification
