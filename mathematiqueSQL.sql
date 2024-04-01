1-a )quels sont les professeurs (IDP,noms) nes en 1972 ?

select IDP ,NOM
from PROF 
where ANNEE_NAISSANCE = 1972 ;

1-b) donner toutes les informations des devoirs de niveau "4eme"

SELECT *
FROM DEVOIR
JOIN NIVEAU N ON DEVOIR.NIVEAU = N.NIVEAU
WHERE N.NIVEAU = '4eme';

1-c)Donner la liste des etablissements inscrits de l herault . On les reperera grace a leur numero RNE commencant par 034                

SELECT *
FROM ETABLISSEMENT
WHERE RNE LIKE '034%';

1-d)donner la liste des exercices (IDEX ,Niveau , Proprietaire ) dont le contenue contient le mot "calculer" .

select * 
from EXERCICE 
where 	 CONTENU like '%calculer%' ;


1-e)Donner la liste des exercices rattaches aux niveaux corresponts au cycle 4 (5eme,4eme,3eme).cette liste sera ordonnee par ordre decroissant de date de creation 

select * 
from EXERCICE 
where NIVEAU in ( '5eme', '4eme','3eme')
order by DATE_CREATION desc;

1-f) donner liste des exercices (IDEX,BAREME)ayant deja ete utilises dans au moins un devoirs ,ranges dans l ordre decroissant de leur bareme dans ce devoir 

SELECT EXERCICE.IDEX, CONTENU.BAREME
FROM EXERCICE
JOIN CONTENU ON EXERCICE.IDEX = CONTENU.IDEX
ORDER BY CONTENU.BAREME DESC;

2- EXPRESSION DES JOINTURE 

a- quelle est la note obtenue par l eleve "Maxime Dupont" au devoir n7 ?
	
select P.NOTE 
from PASSAGE P 
join ELEVE E on E.IDEL = P.IDEL 
where E.NOM = 'Dupond'  AND  E.PRENOM ='Maxime'  AND  P.IDD = 6 ; 
			 
			 oubien
			 
SELECT P.NOTE
FROM PASSAGE P
JOIN ELEVE E ON P.IDEL = E.IDEL
JOIN DEVOIR D ON P.IDD = D.IDD
WHERE E.NOM = 'Dupont' AND E.PRENOM = 'Maxime' AND D.IDD = 7;


OU 
		SELECT PASSAGE.NOTE
		FROM PASSAGE
		JOIN ELEVE ON PASSAGE.IDEL = ELEVE.IDEL
		JOIN DEVOIR ON PASSAGE.IDD = DEVOIR.IDD
		WHERE ELEVE.NOM = 'Dupont' AND ELEVE.PRENOM = 'Maxime' AND DEVOIR.IDD = 7;


3- FORMULATION DE CALCULS HORIZONTAUX 

	a- combien y a-t-il d eleves inscrits actuellement dans la base ?
	
	select count(*) 
	from ELEVE
	
	
	b- sur combien de point sera note le devoir n4 ?
	
	select sum(bareme )
	from CONTENU 
	where IDD= 6 ;
	
4-UTILISATION DES OPERATEURS ENSEMBLISTES 

a-Donner la liste des eleves n ayant jamais passes de devoirs 
	
	
	SELECT *
	FROM ELEVE
	WHERE IDEL NOT IN (SELECT DISTINCT IDEL FROM PASSAGE);

b-liste des profs ayant deja crees des exercices ou des devoirs
	
	select IDP ,nom 
	from PROF
	where  IDP in (select PROPRIETAIRE  
				   from EXERCICE ) 
				or  
				 IDP in (select PROF_CREATEUR 
						 from devoir )
ou bien 

    UNION
	SELECT PROF.*
	FROM PROF
	JOIN DEVOIR ON PROF.IDP = DEVOIR.PROF_CREATEUR;
	
d-existe-il des niveaux pour les quels il n existe pas d exercice disponible

	select niveau 
	from niveau 
	where niveau not in (select niveau 
						 from exercice)
SELECT N.NIVEAU
FROM NIVEAU N
EXCEPT
SELECT E.NIVEAU
FROM EXERCICE E;

e-liste des exercices n ayant jamais ete utiliser dans un devoir
	
	select IDEX
	from EXERCICE 
	except (select N.IDEXO 
			from NOTION N)
			
5-Expression de partitionnements

5-a)Donner,pour chaque niveau ,le nombre d exercice disponible 

select E.NIVEAU , count(*)
from EXERCICE E 
JOIN NIVEAU N ON N.NIVEAU=E.NIVEAU 
GROUP BY E.NIVEAU 

5-b)pour chaque prof , le nbr d exo cree pour chaque niveau (0 s il n a rien cree )

 select P.NOM,N.NIVEAU ,COUNT(D.IDD)
 FROM PROF P
 CROSS JOIN NIVEAU N
 LEFT JOIN DEVOIR D ON P.IDP=D.PROF_CREATEUR AND N.NIVEAU = D.NIVEAU

 GROUP BY P.NOM ,N.NIVEAU
 ORDER BY 
    P.NOM, N.NIVEAU;

5-c)pour chaque eleve , le nbr d exo traitE pour chaque notion (0 s il n a rien cree )

selecT E.NOM , N.NOTION 
FROM ELEVE E
CROSS JOIN NOTION N 
LEFT JOIN EXERCICE EX ON EX.PROPRIETAIRE =E.IDE AND N.NOTION = EX.NOTION
GROUP  BY E.NOM , N.NOTION  
ORDER BY E.NOM , N.NOTION 

5-d)quelles a etait le moins bonne note obtenue par "Arnaud Dupont" a un devoir ?
(on affiche le numero du devoir ,la note obtenue ,le total de point ainsi que la quotient correspondant a sa note ) 

		
		
		SELECT P.IDD,P.NOTE
		FROM PASSAGE P
		JOIN ELEVE E ON P.IDEL=E.IDEL 
		WHERE  E.NOM ='Dupon'	AND E.PRENOM = 'Arnaud'
			   AND P.NOTE <= ALL(SELECT P2.NOTE
								 FROM PASSAGE P2 
								 JOIN ELEVE E2 ON P2.IDEL=E2.IDEL
								 WHERE E2.NOM ='Dupont'	AND E2.PRENOM = 'Arnaud')
			   
			   
			   
	   
			   
			   
			   


