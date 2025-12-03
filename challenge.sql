--- INSERT - Création d'un nouvel utilisateur:

INSERT INTO utilisateur (email , user_name , password , date_cre_compte , role)
VALUES
('jean.dupont@email.com','jdupont','$2y$10$...','2024-01-15 10:00:00','editor');

--- SELECT - Récupération d'articles

SELECT titre , date_cre_article , statut_article FROM article;

--- UPDATE - Modification de statut

UPDATE article 
SET statut_article = 'archivé' 
WHERE statut_article = 'draft' AND 	date_cre_article < '2024-01-01 00:00:00';

--- 4. DELETE - Nettoyage des commentaires



--- 5. WHERE - Filtrage temporel

SELECT * FROM article 
WHERE date_cre_article > '2024-12-01' ;

--- 6. ORDER BY - Tri chronologique

SELECT id_utilisateur, user_name , date_cre_compte FROM utilisateur
ORDER BY date_cre_compte ASC;

--- 7. LIMIT - Articles récents

SELECT titre , date_cre_article FROM article
ORDER BY date_cre_article DESC LIMIT 5 ;

--- 8. DISTINCT - Rôles uniques 

SELECT DISTINCT role 
FROM utilisateur ; 

--- 9. AND/OR - Articles par catégorie et statut

SELECT * FROM article
WHERE id_categorie = 1
AND (statut_article = 'published' OR statut_article = 'advanced draft'); 

--- 10. BETWEEN - Commentaires par période

SELECT * FROM commentaire
WHERE date_cre_comment BETWEEN '2025-10-01' AND '2025-10-15';

--- 11. IN - Articles par catégories multiples





--- 12. LIKE - Recherche par email
 
SELECT * FROM utilisateur
WHERE email LIKE "%@gmail.com" ;  

--- 13. COUNT() - Statistique articles

SELECT COUNT(*) FROM article 
WHERE statut_article = "published";

--- 14. COUNT() avec GROUP BY - Articles par catégorie

SELECT id_categorie, COUNT(*) AS total_articles 
FROM article
GROUP BY id_categorie;


--- 15. AVG() - Longueur moyenne des articles

SELECT AVG (contenu_article) AS longeur_moy
FROM article
WHERE statut_article='published';

--- 16. MAX()/MIN() - Dates extrêmes

SELECT MAX(date_cre_article) AS dernier_article
FROM article
WHERE statut_article = 'published';

SELECT MIN(date_cre_comment) AS premier_commentaire
FROM commentaire;

--- 17. SUM() - Total des vues
 
