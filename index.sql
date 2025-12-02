CREATE DATABASE BlogCms ; 

USE blogcms ; 

CREATE TABLE utilisateur(
	email varchar(50) PRIMARY KEY UNIQUE,
	user_name VARCHAR(50) UNIQUE NOT NULL, 
    nom VARCHAR(20) , 
    prenom VARCHAR (20),
    password VARCHAR(30) NOT NULL, 
    date_cre_compte DATE ,
    role VARCHAR(20) CHECK (role IN ('admin', 'invite'))
);

CREATE TABLE categorie (
    id_categorie INT PRIMARY KEY AUTO_INCREMENT, 
    nom_categorie VARCHAR(50) NOT NULL
);

CREATE TABLE article (
	id_article INT PRIMARY KEY AUTO_INCREMENT,
    titre VARCHAR(20) NOT NULL,
    contenu_article TEXT NOT NULL ,
    date_cre_article DATE NOT NULL,
    date_modification DATE ,
    email varchar(50) ,
    id_categorie INT , 
    FOREIGN KEY(email) REFERENCES utilisateur (email),
    FOREIGN KEY(id_categorie) REFERENCES categorie (id_categorie)
);

CREATE TABLE commentaire (
	id_commentaire INT PRIMARY KEY AUTO_INCREMENT ,
	date_cre_comment DATE ,
    contenu_comment TEXT ,
    email varchar(50),
    id_article INT,
    FOREIGN KEY(email) REFERENCES utilisateur (email),
    FOREIGN KEY(id_article) REFERENCES article (id_article)
);

INSERT INTO utilisateur (email , user_name , nom , prenom , password , date_cre_compte , role )
VALUES ('nohakasmi@gmailcom' , 'noha_kasmi' , 'noha' , 'kasmi', 'passwordnoha123' , '2025-12-25' , 'admin'),
('aminakhalafi@gmailcom' , 'amina khalafi' , 'amina' , 'khalafi', 'passwordkhalafi123' , '2025-11-22' , 'invite'),
('soulaimanchoufri@gmailcom' , 'soulaiman chou' , 'soulaiman' , 'choufri', 'passwordsoulaiman456' , '2025-12-10' , 'invite');

INSERT INTO categorie (id_categorie, nom_categorie)
VALUES (1, 'Base de données'),
(2, 'JavaScript'),
(3, 'CSS');

INSERT INTO article (titre, contenu_article, date_cre_article, date_modification, email, id_categorie)
VALUES ('MySQL', 'Ici se trouvent les bases pour s entrainer sur MySQL', '2025-10-25', '2025-11-02', 'nohakasmi@gmail.com', 1),
('JavaScript', 'Ici se trouvent les bases pour s entrainer sur JavaScript', '2025-01-20', '2025-06-02', 'aminakhalafi@gmail.com', 2),
('CSS', 'Ici se trouvent les bases pour s entrainer sur CSS', '2025-09-25', '2025-11-10', 'soulaimanchoufri@gmail.com', 3);


INSERT INTO commentaire (date_cre_comment, contenu_comment, email, id_article)
VALUES ('2025-11-02', 'C est bien', 'nohakasmi@gmail.com', 10),
('2025-05-20', 'C est génial', 'aminakhalafi@gmail.com', 11),
('2025-06-02', 'C est cool', 'soulaimanchoufri@gmail.com', 12);
