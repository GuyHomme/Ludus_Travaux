{
ALGO: Exemple_Fichier_Type
BUT: Illustrer l'utilisation d'un fichier typé avec un algorithme
ENTREES: Fichier typé, données du fichier, confirmation utilisateur
SORTIES: Affichages console, création fichier, écriture fichier

//NOTE: Avant utilisation, veillez bien à remplacer la chaine CheminAcces par l'adresse souhaitée.
//La nomenclature voulue du fichier étant définie par la constante Fichier, veuillez laisser la concaténation.

//Cet algorithme ne gère pas la validité d'un nom

CONST
	Fichier=("T.bin")
	CheminAcces=("C:\Users\Etudiant\Desktop\Ludus\TP ALGO\Algos\Exemple_Fichier_Type\" & Fichier)
	poidsmax=600
	poidsmin=40
	taillemin=140
	taillemax=250
	maxindividu=4
	
TYPE
	genre=(homme,femme)
	
TYPE
	Individu=ENREGISTREMENT
		nom:CHAINE
		sexe:genre
		poidskg:poidsmin..poidsmax
		taillecm:taillemin..taillemax
FIN ENREGISTREMENT

TYPE
	Grille=ENREGISTREMENT
		Personnes:TABLEAU[1..maxindividu]DE Individu
FIN ENREGISTREMENT

TYPE
	IndividuFichier=FICHIER DE Individu			//Déclaration du type IndividuFichier qui est un fichier d'Individus
	
PROCEDURE CreaIndividu(var personne:Individu)

//BUT:	Assigner une variable de type individu
//ENTREES:	Variable de type individu
//SORTIES:	Variable de type individu

		VAR
			commande:1..2		//Commande seulement utilisée pour choisir homme ou femme, il n'y a que deux choix possibles
		DEBUT
			ECRIRE("Entrez le nom de la personne")
			LIRE(personne.nom)
			ECRIRE("Entrez le sexe de la personne (1=Homme ; 2=Femme)")
			LIRE(commande)
			CAS commande PARMI
				1:personne.sexe<-homme
				2:personne.sexe<-femme
			//1 représente la valeur homme du type genre. 2 représente la valeur femme du type genre.
			FIN CAS PARMI
			ECRIRE("Entrez le poids en kg de la personne (De " & poidsmin & " à " & poidsmax & ")")
			LIRE(personne.poidskg)
			ECRIRE("Entrez la taille en cm de la personne (De " & taillemin & " à " & taillemax & ")")
			LIRE(personne.taillecm)
		FIN
	
PROCEDURE AffichageIndividu(personne:Individu)

//BUT: Afficher les attributs d'une variable de type Individu
//ENTREES: Variable de type Individu
//SORTIES: Affichage attributs

		DEBUT
			ECRIRE("Nom : ' & personne.nom)
			ECRIRE("Sexe : ' & personne.sexe)
			ECRIRE("Poids : ' & personne.poidskg & " kg")
			ECRIRE("Taille : ' & personne.taillecm & " cm")
		FIN
	
PROCEDURE StockageIndividu_F(var t:IndividuFichier ; Groupe:Grille ; numero:ENTIER)

//BUT: Stocker un nombre défini par numero, de variables de type Individu dans un fichier
//ENTREES: Variable de type IndividuFichier. Variable de type Grille contenant des variables de type Individu. numero qui définit le numéro de l'individu dont il est question
//SORTIES: Modification du contenu du fichier.

		VAR
			i:ENTIER
		DEBUT
			REECRIRE(t)
				POUR i DE 1 A numero FAIRE
					ECRIRE(t,Groupe.Personnes[i])
				FIN POUR
			FERMER(t)
		FIN

PROCEDURE LectureIndividu(var t:IndividuFichier)

//BUT: Extraire des données du fichier de type IndividuFichier
//ENTREES: Variable de type IndividuFichier
//SORTIES: Extraction de données du fichier et appel de la procédure AffichageIndividu
		
		VAR
			commande:1..maxindividu		//Variable définissant l'individu souhaité
			TempIndividu:Individu		//Variable intermédiaire de stockage de type Individu
		DEBUT
			ECRIRE("Choisissez le numéro de l'individu dont vous voulez voir les caractéristiques (De 1 à " & maxindividu & ")" )
			LIRE(commande)
			OUVRIR(t)
			//Ouverture du fichier T en mode lecture
				RECHERCHE(t,commande-1)	//Fonction de recherche de l'individu N°<commande>-1 (La première ligne commence à 0), à expliciter en fonction du langage
				LIRE(t,TempIndividu)
				//Assignation de la variable TempIndividu avec les données se trouvant à l'emplacement du curseur
			FERMER(t)
			//Fermeture du fichier T
			AffichageIndividu(TempIndividu)
			//Appel de la procédure affichant un individu, pour l'individu choisi précédemment
		FIN
		
VAR
	t:IndividuFichier	//Variable typée FICHIER DE Grille car le fichier testé sera un fichier typé
	Groupe:Grille
	i:ENTIER
	commande:0..1		//La commande permettra à l'utilisateur d'afficher un individu choisi, ou de quitter le programme en supprimant le fichier T
	
DEBUT
	ASSIGNER(t,CheminAcces)
		//La variable t est assignée au fichier <nom_déclaré_dans_la_constante> typé
		//Elle permet d'accéder aux données contenues dans <nom_déclaré_dans_la_constante>
		//A chaque fois que t sera évoquée, on fera référence au fichier.txt <nom_déclaré_dans_la_constante>
	POUR i DE 1 A maxindividu FAIRE
	//Pour chaque individu jusqu'au nombre maximal
		ECRIRE("Personne N°" & i)
		CreaIndividu(Groupe.Personnes[i])
		//Appel de la procédure de création d'individu pour la cellule i du tableau Personnes
		StockageIndividu_F(t,Groupe,i)
		//Appel de la procédure de stockage des variables de type Individu dans le fichier T
	FIN POUR
	REPETER
		ECRIRE("0=Supprimer le fichier ; 1=Afficher un individu au choix")
		LIRE(commande)
			CAS commande PARMI
				1:LectureIndividu(t)
				//Appel de la procédure de lecture d'individu permettant d'afficher l'individu souhaité
				0:SUPPRIMER(CheminAcces)	//Fonction qui supprime le fichier créée, à expliciter en fonction du langage
	JUSQU'A (commande=0)
FIN
	
	
	
	}

PROGRAM Exemple_Fichier_Type;

//NOTE: Avant utilisation, veillez bien à remplacer la chaine CheminAcces par l'adresse souhaitée.
//La nomenclature voulue du fichier étant définie par la constante Fichier, veuillez laisser la concaténation.

//Ce programme ne gère pas la validité d'un nom

uses crt,sysutils;

CONST
	Fichier=('T.bin');
	CheminAcces=('C:\Users\Etudiant\Desktop\Ludus\TP ALGO\Algos\Exemple_Fichier_Type\'+Fichier);
	poidsmax=600;
	poidsmin=40;
	taillemin=140;
	taillemax=250;
	maxindividu=4;

TYPE
	genre=(homme,femme);
	
TYPE 
	Individu=RECORD
		nom:STRING;
		sexe:genre;
		poidskg:poidsmin..poidsmax;
		taillecm:taillemin..taillemax;
END;

TYPE
	Grille=RECORD
		Personnes:ARRAY[1..maxindividu]OF Individu;
END;

TYPE 
	IndividuFichier=FILE OF Individu;	//Déclaration du type IndividuFichier qui est un fichier d'Individus
	

PROCEDURE CreaIndividu(var personne:Individu);

//BUT:	Assigner une variable de type individu
//ENTREES:	Variable de type individu
//SORTIES:	Variable de type individu
		VAR
			commande:1..2;		//Commande seulement utilisée pour choisir homme ou femme, il n'y a que deux choix possibles
		BEGIN
			writeln('Entrez le nom de la personne');
			readln(personne.nom);
			writeln('Entrez le sexe de la personne (1=Homme ; 2=Femme)');
			readln(commande);
			CASE commande OF
				1:personne.sexe:=homme;
				2:personne.sexe:=femme;
			//1 représente la valeur homme du type genre. 2 représente la valeur femme du type genre.
			END;
			writeln('Entrez le poids en kg de la personne (De ' , poidsmin , ' à ' , poidsmax , ')');
			readln(personne.poidskg);
			writeln('Entrez la taille en cm de la personne (De ', taillemin, ' à ', taillemax, ')');
			readln(personne.taillecm);
		END;
		
PROCEDURE AffichageIndividu(personne:Individu);
		
//BUT: Afficher des attributs de chaque variable de type Individu contenue dans un tableau
//ENTREES: Variable de type individu
//SORTIES: Affichage attributs
		
		BEGIN
			writeln('Nom : ',personne.nom);
			writeln('Sexe : ',personne.sexe);
			writeln('Poids : ',personne.poidskg,' kg');
			writeln('Taille : ',personne.taillecm,' cm');
		END;

PROCEDURE StockageIndividu_F(var t:IndividuFichier ; Groupe:Grille ; numero:INTEGER);

//BUT: Stocker un nombre défini par numero, de variables de type Individu dans un fichier
//ENTREES: Variable de type IndividuFichier. Variable de type Grille contenant des variables de type Individu. numero qui définit le numéro de l'individu dont il est question
//SORTIES: Modification du contenu du fichier.

		VAR
			i:INTEGER;
		BEGIN
			REWRITE(t);
				FOR i:=1 TO numero DO
					BEGIN
						write(t,Groupe.Personnes[i]);
					END;
			CLOSE(t);
		END;

PROCEDURE LectureIndividu(var t:IndividuFichier);

//BUT: Extraire des données du fichier de type IndividuFichier
//ENTREES: Variable de type IndividuFichier
//SORTIES: Extraction de données du fichier et appel de la procédure AffichageIndividu

		VAR
			commande:1..maxindividu;	//Variable définissant l'individu souhaité
			TempIndividu:Individu;		//Variable intermédiaire de stockage de type Individu
		BEGIN
			writeln('Choisissez le numéro de l''individu dont vous voulez voir les caractéristiques (De 1 à ' , maxindividu , ')' );
			readln(commande);
			RESET(t);
			//Ouverture du fichier T en mode lecture
				SEEK(t,commande-1); //Fonction de recherche de l'individu N°<commande>-1 (La première ligne commence à 0), à expliciter en fonction du langage
				read(t,TempIndividu);
				//Assignation de la variable TempIndividu avec les données se trouvant à l'emplacement du curseur
			CLOSE(t);
			//Fermeture du fichier T
			AffichageIndividu(TempIndividu);
			//Appel de la procédure affichant un individu, pour l'individu choisi précédemment
		END;


	VAR
		t:IndividuFichier; //Variable typée FICHIER DE Grille car le fichier testé sera un fichier typé
		Groupe:Grille;
		i:INTEGER;
		commande:0..1;		//La commande permettra à l'utilisateur d'afficher un individu choisi, ou de quitter le programme en supprimant le fichier T
BEGIN
	clrscr;
	ASSIGN(t,CheminAcces);
	//La variable t est assignée au fichier <nom_déclaré_dans_la_constante> typé
	//Elle permet d'accéder aux données contenues dans <nom_déclaré_dans_la_constante>
	//A chaque fois que t sera évoquée, on fera référence au fichier.txt <nom_déclaré_dans_la_constante>
	FOR i:=1 TO maxindividu DO
	//Pour chaque individu jusqu'au nombre maximal
		BEGIN
			writeln('Personne N°',i);
			CreaIndividu(Groupe.Personnes[i]);
			//Appel de la procédure de création d'individu pour la cellule i du tableau Personnes
			StockageIndividu_F(t,Groupe,i);
			//Appel de la procédure de stockage des variables de type Individu dans le fichier T
			clrscr;
		END;
	REPEAT
		writeln;
		writeln('0=Supprimer le fichier ; 1=Afficher un individu au choix');
		readln(commande);
			CASE commande OF
				1:LectureIndividu(t);
				//Appel de la procédure de lecture d'individu permettant d'afficher l'individu souhaité
				0:DeleteFile(CheminAcces);	//Fonction qui supprime le fichier créée, à expliciter en fonction du langage
			END;
	UNTIL (commande=0);
	
END.