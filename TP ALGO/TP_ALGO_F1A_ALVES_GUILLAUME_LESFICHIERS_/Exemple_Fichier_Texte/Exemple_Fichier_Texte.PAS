{
ALGO: Exemple_Fichier_Texte
BUT: Illustrer l'utilisation d'un fichier texte avec un algorithme
ENTREES: Fichier txt, confirmation utilisateur
SORTIES: Affichages console, création fichier, écriture fichier

//NOTE: Avant utilisation, veillez bien à remplacer la chaine CheminAcces par l'adresse souhaitée.
//La nomenclature voulue du fichier étant définie par la constante Fichier, veuillez laisser la concaténation.

CONST
	Fichier=("F.txt")
	CheminAcces=("C:\Users\Etudiant\Desktop\Ludus\TP ALGO\Algos\Exemple_Fichier_Texte\" & Fichier)


PROCEDURE ExempleCreationFichier(var f:FICHIER TEXTE ; p:CHAINE)

//BUT: Créer un fichier.txt avec p comme première ligne
//ENTREES: Variable de type FICHIER TEXTE. Chaine de caractères à ajouter au fichier après création OU réécriture
//SORTIES: Création du fichier
		
		DEBUT
			REECRIRE(f)
			//Création du fichier F (f étant assigné à F)
				ECRIRE(f,p)
				//Ecriture de p dans le fichier
			FERMER(f)
			//Fermeture du fichier
		FIN
	
	
PROCEDURE ExempleOuverture(f:FICHIER TEXTE ; NumeroLigne:ENTIER)

//BUT:	Illustrer la méthode OUVRIR et afficher la ligne du fichier.txt entrée en paramètre
//ENTREES: Variable de type FICHIER TEXTE ; Numéro de la ligne souhaitée
//SORTIES: Affichage ligne souhaitée

		VAR
		p:CHAINE
		i:ENTIER
		DEBUT
			i<-1
			OUVRIR(f)
			//Ouverture de la variable f en lecture car F est déjà créée
			//Autrement il aurait fallu utiliser REWRITE(f) au préalable
			TANT QUE (i<NumeroLigne) FAIRE
			//Tant que le numéro de la ligne souhaitée n'est pas atteint
				LIRE()
				i<-i+1
				//Saut de ligne + incrémentation
			FIN TANT QUE
				LIRE(f,p)
				//Extraction du contenu de la première ligne de f dans la variable p
				ECRIRE(p)
				//Affichage de p
			FERMER(f)
			//Fermeture du fichier
		FIN

		
PROCEDURE ExempleAjout(var f:FICHIER TEXTE ; p:CHAINE)

//BUT: Ajouter une chaine de caractères passée en paramètre dans la variable de type FICHIER TEXTE passée en paramètre
//ENTREES: Variable de type FICHIER TEXTE. Chaine de caractères à ajouter au contenu du fichier
//SORTIES: Ajout chaine de caractères dans le fichier

		DEBUT
			AJOUTER(f)
			//Ouverture de la variable en écriture. On ne veut pas écraser le contenu précédemment entré.
				ECRIRE(f,p)
				//Ecriture de p à la suite du fichier
			FERMER(f)
			//Fermeture du fichier
			ExempleOuverture(f,2)
			//Lancement de la procédure de lecture du fichier. 2 pour la référence de la ligne
		FIN
		
		
VAR
	f:FICHIER TEXTE	//Variable typée FICHIER TEXTE car le fichier testé sera un fichier.txt
	p:CHAINE
	
DEBUT
	ASSIGNER(f,"CheminAcces")
		//La variable f est assignée au fichier <nom_déclaré_dans_la_constante> de type texte
		//Elle permet d'accéder aux données contenues dans <nom_déclaré_dans_la_constante>
		//A chaque fois que f sera évoquée, on fera référence au fichier.txt <nom_déclaré_dans_la_constante>
	p<-("Premier exemple: Voici la première ligne du fichier qui fut ajoutée par la procédure ExempleCreationFichier")
		//Assignation de la variable p avec une phrase exemple
	ExempleCreationFichier(f,p)
		//Appel de la procédure de création OU de réécriture du fichier.
	ECRIRE("Le fichier a bien été créée, et édité. Appuyez sur entrée pour continuer.")
	LIRE()	//Friendly User
	ExempleOuverture(f,1)
		//Appel de la procédure de lecture du fichier. 1 pour la référence de la ligne
	ECRIRE("Appuyez sur entrée pour continuer.")
	LIRE()	//Friendly User
	p<-("Deuxième exemple: Voici la seconde ligne du fichier qui fut ajoutée par la procédure ExempleAjout")
		//Assignation de la variable p avec la seconde phrase exemple
	ExempleAjout(f,p)
		//Appel de la procédure d'ajout de données
	ExempleOuverture(f,2)
		//Appel de la procédure de lecture du fichier. 2 pour la référence de la ligne
	ECRIRE("A vous !")
	ECRIRE("Entrez la première phrase que vous voulez stocker dans le fichier.txt :")
		//Nouvelle édition du programme pour que l'utilisateur teste lui-même
	LIRE(p)
		//Assignation de la variable p par l'utilisateur
	ExempleCreationFichier(f,p)
		//Appel de la procédure de réécriture du fichier, écrasement des données précédentes
	ECRIRE("Le fichier a bien été édité. Appuyez sur entrée pour continuer.")
	LIRE()
	ExempleOuverture(f,1)
		//Appel de la procédure de lecture du fichier. 1 pour la référence de la ligne
	ECRIRE("Entrez la deuxième phrase que vous voulez stocker dans le fichier.txt :")
	LIRE(p)
	ExempleAjout(f,p)
		//Appel de la procédure d'ajout de données
	ExempleOuverture(f,2)
		//Appel de la procédure de lecture du fichier. 2 pour la référence de la ligne
	ECRIRE("Le fichier va maintenant être supprimé")
	SUPPRIMER("CheminAcces")	//Fonction qui supprime le fichier créée, à expliciter en fonction du langage
	
FIN
}

PROGRAM Exemple_Fichier_Texte;

//NOTE: Avant utilisation, veillez bien à remplacer la chaine CheminAcces par l'adresse souhaitée.
//La nomenclature voulue du fichier étant définie par la constante Fichier, veuillez laisser la concaténation.

uses crt, sysutils;

CONST
	Fichier=('F.txt');
	CheminAcces=('C:\Users\Etudiant\Desktop\Ludus\TP ALGO\Algos\Exemple_Fichier_Texte\'+Fichier);

PROCEDURE ExempleCreationFichier(var f:TEXTFILE ; p:STRING);

//BUT:Créer un fichier.txt
//ENTREES: Variable de type TEXTFILE
//SORTIES: Création du fichier

		BEGIN
			REWRITE(f);
			//Création du fichier F (f étant assigné à F)
				writeln(f,p);
				//Ecriture du premier exemple
			CLOSE(f);
			//Fermeture du fichier
			writeln;
		END;

PROCEDURE ExempleOuverture(var f:TEXTFILE ; NumeroLigne:INTEGER);

//BUT:Illustrer la méthode OUVRIR
//ENTREES: Variable de type TEXTFILE
//SORTIES: Affichage contenu

		VAR
			p:STRING;
			i:INTEGER;
		BEGIN
			i:=1;
			RESET(f);
			//Ouverture de la variable f en lecture car F est déjà créée
			//Autrement il aurait fallu utiliser REWRITE(f) au préalable
				WHILE (i<NumeroLigne) DO
				//Tant que le numéro de la ligne souhaitée n'est pas atteint
					BEGIN
						readln(f);
						i:=i+1;
						//Saut de ligne + incrémentation
					END;
				readln(f,p);
				//Extraction du contenu de la première ligne de f dans la variable p
				writeln('Ligne N°',i,' : ',p);
				//Affichage de p (possible car en mode lecture)
			CLOSE(f);
			//Fermeture du fichier
			writeln;
		END;


PROCEDURE ExempleAjout(var f:TEXTFILE ; p:STRING);

//BUT: Ajouter une chaine de caractères dans la variable passée en paramètre
//ENTREES: Variable de type FICHIER TEXTE
//SORTIES: Ajout chaine de caractères dans le fichier

		BEGIN
			APPEND(f);
			//Ouverture de la variable en écriture. On ne veut pas écraser le contenu précédemment entré.
				writeln(f,p);
				//Ecriture du second exemple
			CLOSE(f);
			//Fermeture du fichier
			writeln;
		END;
		

VAR
	f:TEXTFILE;		//Variable typée TEXTFILE car le fichier testé sera un fichier.txt
	p:STRING;		//Variable de type chaine pour stocker les messages/articles
BEGIN
	clrscr;
	ASSIGN(f,CheminAcces);
	{La variable f est assignée au fichier <nom_déclaré_dans_la_constante> de type texte
	Elle permet d'accéder aux données contenues dans <nom_déclaré_dans_la_constante>
	A chaque fois que f sera évoquée, on fera référence au fichier.txt <nom_déclaré_dans_la_constante>}
	p:=('Premier exemple: Voici la première ligne du fichier qui fut ajoutée par la procédure ExempleCreationFichier');
	//Assignation de la variable p avec une phrase exemple
	ExempleCreationFichier(f,p);
	//Appel de la procédure de création OU de réécriture du fichier.
	writeln('Le fichier a bien été créée, et édité. Appuyez sur entrée pour continuer');
	readln;	//Friendly User
	ExempleOuverture(f,1);
	//Appel de la procédure de lecture du fichier. 1 pour la référence de la ligne
	writeln('Appuyez sur entrée pour continuez');
	readln;	//Friendly User
	p:=('Deuxième exemple: Voici la seconde ligne du fichier qui fut ajoutée par la procédure ExempleAjout');
	//Assignation de la variable p avec la seconde phrase exemple
	ExempleAjout(f,p);
	//Appel de la procédure d'ajout de données
	ExempleOuverture(f,2);
	//Appel de la procédure de lecture du fichier. 2 pour la référence de la ligne
	writeln('A vous !');
	writeln('Entrez la première phrase que vous voulez stocker dans le fichier.txt :');
	//Nouvelle édition du programme pour que l'utilisateur teste lui-même
	readln(p);
	//Assignation de la variable p par l'utilisateur
	ExempleCreationFichier(f,p);
	//Appel de la procédure de réécriture du fichier, écrasement des données précédentes
	writeln('Le fichier a bien été édité. Appuyez sur entrée pour continuer.');
	readln;
	ExempleOuverture(f,1);
	//Appel de la procédure de lecture du fichier. 1 pour la référence de la ligne
	writeln('Entrez la deuxième phrase que vous voulez stocker dans le fichier.txt :');
	readln(p);
	ExempleAjout(f,p);
	//Appel de la procédure d'ajout de données	
	ExempleOuverture(f,2);
	//Appel de la procédure de lecture du fichier. 2 pour la référence de la ligne
	writeln('Le fichier va maintenant être supprimé');
	readln;
	DeleteFile(CheminAcces);
END.
