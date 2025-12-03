CREATE DATABASE blogcms ; 

USE blogcms ; 

CREATE TABLE utilisateur(
    id_utilisateur INT PRIMARY KEY AUTO_INCREMENT , 
	email varchar(50) UNIQUE NOT NULL,
	user_name VARCHAR(50) UNIQUE NOT NULL, 
    password VARCHAR(100) NOT NULL, 
    date_cre_compte DATETIME ,
    role VARCHAR(20) CHECK (role IN ('admin', 'author','editor'))
);

CREATE TABLE categorie (
    id_categorie INT PRIMARY KEY AUTO_INCREMENT, 
    nom_categorie VARCHAR(50) NOT NULL
);


CREATE TABLE article (
    id_article INT PRIMARY KEY AUTO_INCREMENT,
    titre VARCHAR(100) NOT NULL,
    contenu_article TEXT NOT NULL,
    date_cre_article DATETIME NOT NULL,
    date_modification DATETIME,
    id_utilisateur INT, 
    id_categorie INT, 
    FOREIGN KEY(id_utilisateur) REFERENCES utilisateur (id_utilisateur),
    FOREIGN KEY(id_categorie) REFERENCES categorie (id_categorie)
);

CREATE TABLE commentaire (
	id_commentaire INT PRIMARY KEY AUTO_INCREMENT ,
	date_cre_comment DATETIME ,
    contenu_comment TEXT ,
    id_article INT,
    id_utilisateur INT NULL,
    FOREIGN KEY(id_utilisateur) REFERENCES utilisateur (id_utilisateur),
    FOREIGN KEY(id_article) REFERENCES article (id_article)
);

ALTER TABLE categorie 
ADD description_categorie TEXT;

INSERT INTO categorie (nom_categorie, description_categorie)
VALUES
('Technologie', 'Actualites, tutoriels et analyses sur les nouvelles technologies'),
('Santé', 'Conseils santé, bien être et médecine préventive'),
('Voyage', 'Récits de voyage, guides pratiques et conseils touristiques'),
('Cuisine', 'Recettes, techniques culinaires et astuces de cuisine'),
('Sport', 'Actualités sportives, conseils d entrainement et nutrition'),
('Éducation', 'Pédagogie, conseils d apprentissage et innovations éducatives'),
('Finance', 'Gestion budgétaire, investissements et actualités économiques'),
('Mode', 'Tendances, conseils style et actualités de la mode');



INSERT INTO utilisateur (email, user_name, password, date_cre_compte, role)
VALUES
('admin@blogcms.com','admin_blog','$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW','2024-01-15 10:00:00','admin'),
('marie.dubois@email.com','marie_dubois','$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW','2024-02-10 11:30:00','author'),
('pierre.leroy@gmail.com','pierre_leroy','$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW','2024-02-15 09:15:00','author'),
('sophie.martin@protonmail.com','sophie_martin','$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW','2024-03-01 14:20:00','author'),
('jean.dupont@yahoo.fr','jean_dupont','$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW','2024-03-10 16:45:00','author'),
('lucie.bernard@email.com','lucie_bernard','$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW','2024-03-15 08:00:00','author'),
('thomas.petit@gmail.com','thomas_petit','$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW','2024-03-20 10:30:00','author'),
('julie.roux@protonmail.com','julie_roux','$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW','2024-04-01 12:00:00','author'),
('marc.vincent@yahoo.fr','marc_vincent','$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW','2024-04-05 15:45:00','author'),
('isabelle.leroy@gmail.com','isabelle_leroy','$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW','2024-04-10 18:20:00','author'),
('david.morel@email.com','david_morel','$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW','2024-04-15 09:30:00','author'),
('caroline.duval@protonmail.com','caroline_duval','$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW','2024-05-02 14:10:00','author'),
('nicolas.lambert@gmail.com','nicolas_lambert','$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW','2024-05-10 11:45:00','author'),
('elodie.garnier@email.com','elodie_garnier','$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW','2024-05-20 16:30:00','author'),
('antoine.chevalier@yahoo.fr','antoine_chevalier','$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW','2024-06-01 08:15:00','author'),
('clara.royer@protonmail.com','clara_royer','$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW','2024-06-10 10:40:00','author'),
('quentin.menard@gmail.com','quentin_menard','$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW','2024-06-15 13:25:00','author'),
('amelie.colin@email.com','amelie_colin','$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW','2024-07-03 17:50:00','author'),
('vincent.gauthier@protonmail.com','vincent_gauthier','$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW','2024-07-12 12:05:00','author'),
('marine.lebrun@gmail.com','marine_lebrun','$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW','2024-07-20 15:20:00','author');

INSERT INTO article (titre , contenu_article , date_cre_article , date_modification , id_utilisateur , id_categorie)
VALUES 
('Les Nouvelles Tensions Technologiques en 2024', 'Explorez les technologies émergentes qui vont transformer notre quotidien cette année...', '2024-02-20 10:00:00', '2024-02-21 11:00:00', 21, 1),
('Comment Maintenir une Bonne Santé au Travail', 'Des conseils pratiques pour préserver votre santé physique et mentale...', '2024-02-25 14:30:00', '2024-02-25 14:30:00', 22, 2),
('Les 10 Destinations à Visiter Absolument en 2024', 'Découvrez les destinations qui vont marquer l année 2024...', '2024-03-05 09:15:00', '2024-03-06 10:30:00', 23, 3),
('Recette du Gâteau au Chocolat Fondant','Une recette simple et rapide pour un gâteau au chocolat irrésistible...','2024-03-10 16:45:00', '2024-03-11 08:30:00', 24, 4),
('Préparation Marathon : Guide Complet du Débutant','Tout ce qu il faut savoir pour préparer son premier marathon...','2024-03-15 08:00:00', '2024-03-16 09:15:00', 25, 5),
('Apprendre à Coder en 6 Mois : Mon Parcours','Comment j ai appris la programmation web en moins de 6 mois...','2024-03-20 10:30:00', '2024-03-21 11:45:00', 26, 6),
('Investir dans la Cryptomonnaie en 2024','Guide pour débutants sur les opportunités et risques...','2024-04-01 12:00:00', '2024-04-02 13:30:00', 27, 7),
('Les Tendances Mode Printemps-Été 2024','Découvrez les must-have de la saison prochaine...', '2024-04-05 15:45:00', '2024-04-06 16:20:00', 28, 8),
('Les Avantages du Télétravail pour la Productivité','Comment le travail à distance peut booster vos performances...','2024-04-10 18:20:00','2024-04-11 10:15:00', 29, 1),
('Les Superaliments pour Renforcer l Immunité','10 aliments à intégrer dans votre alimentation pour être en forme...','2024-04-15 09:30:00','2024-04-16 14:20:00', 30, 2),
('Voyager en Solo : Mes Conseils Sécurité','Guide pratique pour voyager seul en toute sécurité...','2024-04-20 11:45:00','2024-04-21 09:30:00', 31, 3),
('Les Bases de la Pâtisserie Française','Apprenez les techniques fondamentales de la pâtisserie...','2024-05-02 14:10:00','2024-05-03 16:40:00', 32, 4),
('Yoga pour Débutants : Programme sur 30 Jours','Un programme progressif pour découvrir le yoga...','2024-05-10 11:45:00','2024-05-11 12:30:00', 33, 5),
('Les Méthodes d Apprentissage des Langues Efficaces','Comparatif des différentes approches pour apprendre une langue...','2024-05-20 16:30:00','2024-05-21 17:15:00', 34, 6),
('Économiser pour Son Premier Achat Immobilier','Stratégies pour constituer son apport personnel...','2024-06-01 08:15:00','2024-06-02 10:20:00', 35, 7),
('Le Style Minimaliste : Less is More','Comment adopter une garde-robe minimaliste et élégante...','2024-06-10 10:40:00','2024-06-11 11:50:00', 36, 8),
('Introduction à l Intelligence Artificielle','Comprendre les bases de l IA et ses applications...','2024-06-15 13:25:00','2024-06-16 14:30:00', 37, 1),
('La Méditation pour Réduire le Stress','Techniques de méditation accessibles à tous...','2024-07-03 17:50:00','2024-07-04 18:45:00', 38, 2),
('Voyager avec un Petit Budget','Astuces pour voyager sans se ruiner...','2024-07-12 12:05:00','2024-07-13 13:10:00', 39, 3),
('Les Plats Typiques de la Cuisine Marocaine','Découverte des saveurs et traditions culinaires du Maroc...','2024-07-20 15:20:00','2024-07-21 16:25:00', 40, 4),
('Préparation Physique pour le Ski','Conseils pour se préparer avant la saison de ski...','2024-08-01 09:30:00','2024-08-02 10:35:00', 21, 5),
('Les Outils Numériques pour l Éducation','Les meilleures applications pour apprendre et enseigner...','2024-08-10 14:45:00','2024-08-11 15:50:00', 22, 6),
('Comprendre les Marchés Boursiers','Guide pour débutants en bourse...','2024-08-20 11:20:00','2024-08-21 12:25:00', 23, 7),
('Le Style Casual Chic au Bureau','Comment être élégant tout en restant confortable...','2024-09-01 16:30:00','2024-09-02 17:35:00', 24, 8),
('La Sécurité Informatique pour les Particuliers','Protégez vos données et votre vie privée en ligne...','2024-09-10 08:15:00','2024-09-11 09:20:00', 25, 1),
('L Importance du Sommeil pour la Santé','Comment améliorer la qualité de son sommeil...','2024-09-20 10:25:00','2024-09-21 11:30:00', 26, 2),
('Les Plus Beaux Villages de France','Découverte des villages classés parmi les plus beaux de France...','2024-10-01 14:35:00','2024-10-02 15:40:00', 27, 3),
('Les Techniques de Cuisson Santé','Cuire ses aliments tout en préservant les nutriments...','2024-10-10 16:45:00','2024-10-11 17:50:00', 28, 4),
('Le CrossFit : Avantages et Risques','Analyse complète de cette discipline sportive...','2024-10-20 12:55:00','2024-10-21 13:00:00', 29, 5),
('Apprendre par le Jeu : La Ludopédagogie','Utiliser le jeu comme outil d apprentissage...','2024-11-01 09:05:00','2024-11-02 10:10:00', 30, 6);


INSERT INTO commentaire (date_cre_comment, contenu_comment, id_article, id_utilisateur)
VALUES
('2024-02-21 12:30:00', "Excellent article, très bien documenté !", 31, 21),
('2024-02-22 15:45:00', "Je ne suis pas tout à fait d'accord sur certains points.", 31, 22),
('2024-02-25 16:00:00', "Cela m'a beaucoup aidé, merci pour ces conseils.", 32, 23),
('2024-02-26 10:15:00', "Très bel article, les photos sont magnifiques !", 33, 24),
('2024-02-27 14:20:00', "Je trouve que certains conseils sont dangereux.", 34, 25),
('2024-02-28 11:30:00', "Parfait pour les débutants comme moi, merci !", 35, 26),
('2024-02-29 09:45:00', "Très détaillé, j'ai appris beaucoup de choses.", 36, 27),
('2024-03-01 13:00:00', "C'est exactement ce que je cherchais, merci !", 37, 28),
('2024-03-02 16:15:00', "Je ne comprends pas la partie sur les investissements.", 38, 29),
('2024-03-03 10:30:00', "Super article, j'ai hâte de lire la suite !", 39, 30),
('2024-03-04 14:45:00', "Les tendances présentées sont déjà dépassées.", 40, 31),
('2024-03-05 09:00:00', "Je vais essayer la recette ce week-end !", 41, 32),
('2024-03-06 12:15:00', "Bonnes astuces pour économiser, merci.", 42, 33),
('2024-03-07 15:30:00', "Le style minimaliste n'est pas pour tout le monde.", 43, 34),
('2024-03-08 11:45:00', "Très bon tutoriel sur l'IA pour débutants.", 44, 35),
('2024-03-09 09:00:00', "La méditation a changé ma vie, merci pour l'article.", 45, 36),
('2024-03-10 13:15:00', "Voyager avec un petit budget c'est possible !", 46, 37),
('2024-03-11 16:30:00', "Les plats marocains sont délicieux, merci.", 47, 38),
('2024-03-12 10:45:00', "Je me prépare pour le ski, merci pour les conseils.", 48, 39),
('2024-03-13 14:00:00', "Quelles applications recommandez-vous pour les enfants ?", 49, 40),
('2024-03-14 09:15:00', "La bourse me fait peur, merci pour les explications.", 50, 21),
('2024-03-15 12:30:00', "Je cherche justement un style casual chic, merci !", 51, 22),
('2024-03-16 15:45:00', "Important de parler de sécurité informatique.", 52, 23),
('2024-03-17 11:00:00', "Je dors mal, merci pour ces conseils.", 53, 24),
('2024-03-18 09:15:00', "J'ai visité certains villages, ils sont magnifiques !", 54, 25);

