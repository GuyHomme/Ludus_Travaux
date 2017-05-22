{ALGO:
BUT:	Traitement des fichiers.
		Reprise et élargissement du programme conjugaison.

		=> tableaux, boucles, Text, gestion de fichiers pour conjuguer verbes au présent de l'indicatif.
		Supports mis à disposition :la 1ère version de conjugaison.
		
ENTREES:
SORTIES:}
PROGRAM Algo_fichiers_conjug;
uses crt,sysutils;
CONST
	CheminAcces=('C:\Users\Tamen\Desktop\Ludus\TP ALGO\Algos\Conjugaison\F.txt');
	CheminAcces2=('C:\Users\Tamen\Desktop\Ludus\TP ALGO\Algos\Conjugaison\Verbes_IR_3eme.txt');
	CheminAcces3=('C:\Users\Tamen\Desktop\Ludus\TP ALGO\Algos\Conjugaison\Conj.txt');
	RetourLigne=10;
	nb_verbes=13;
	nb_pronoms=6;
	premier_Car=1;
	VerbALLER='aller';
	
TYPE
	t_Pronoms=RECORD
		Je:STRING;
		Tu:STRING;
		Il:STRING;
		Nous:STRING;
		Vous:STRING;
		Ils:STRING;
END;

TYPE
	tab_verbe=ARRAY[1..nb_verbes]OF STRING;
	Verbe=(premier,deuxieme,troisieme);
	
VAR
	F:TEXTFILE;
	Conj:TEXTFILE;
	Pronoms:t_Pronoms;
	liste:tab_verbe;

{Méthodes à implémenter en fonction du langage:

FichierExiste(NomFichier) : Vérifie si un fichier existe sur le disque dur
lowercase(Chaine) : Convertit une chaine de caractères en son équivalent en minuscules
Eof(Fichier): Vérifie que la fin d'un fichier n'est pas atteinte lors de sa lecture ligne par ligne
}
	
	
FUNCTION Voyelle(t_car:CHAR):BOOLEAN;

{BUT: Vérifier si un caractère est une voyelle
ENTREES: Caractère
SORTIES: Retourne la valeur du test}
	
	VAR
		test:BOOLEAN;

BEGIN
	test:=FALSE;
	t_car:=lowercase(t_car);
	test:=((t_car='a') OR (t_car='e') OR (t_car='i') OR (t_car='o') OR (t_car='u') OR (t_car='y'));
	Voyelle:=test;
END;

FUNCTION VerifChaineFichier(t_chaine:STRING):BOOLEAN;

{BUT: Vérifier si une chaîne appartient à un fichier texte
ENTREES: Chaine de caractères
SORTIES: Retourne la valeur du test si la chaine appartient au fichier}

	VAR
		test:BOOLEAN;
		test_chaine:STRING;
		t_F:TEXTFILE;
BEGIN
	ASSIGN(t_F,CheminAcces2);
	test:=FALSE;
	RESET(t_F);
	WHILE NOT Eof(t_F) DO
		BEGIN
			readln(t_F,test_chaine);
				IF test_chaine=t_chaine THEN
					test:=TRUE
		END;
	CLOSE(t_F);
	VerifChaineFichier:=test;
END;


FUNCTION Verbe_1er(t_chaine:STRING):BOOLEAN;

{BUT: Déterminer si une chaine de caractères est un verbe du premier groupe
ENTREES: Chaine de caractères
SORTIES: Retourne la valeur du test, si la chaine est un verbe du premier groupe}

	VAR
		test_chaine:STRING;
		test:BOOLEAN;
BEGIN
	test:=FALSE;
	test_chaine:=lowercase(copy(t_chaine,length(t_chaine)-1,2));
	test:=((test_chaine='er') AND (t_chaine<>VerbALLER));
	Verbe_1er:=test;
END;

FUNCTION Verbe_2eme(t_chaine:STRING):BOOLEAN;

{BUT: Déterminer si une chaine de caractères est un verbe du deuxième groupe
ENTREES: Chaine de caractères
SORTIES: Retourne la valeur du test, si la chaine est un verbe du deuxième groupe}

	VAR
		test_chaine:STRING;
		test:BOOLEAN;
BEGIN
	test:=VerifChaineFichier(t_chaine);
	Verbe_2eme:=NOT test;
END;


PROCEDURE Conjug_1er(t_chaine:STRING);

{BUT: Conjuguer un verbe du premier groupe
ENTREES: Chaine de caractères
SORTIES: Assignation des variables pronoms personnels }

	VAR
		test_chaine:STRING;

BEGIN
	IF Voyelle(t_chaine[premier_Car]) THEN
		Pronoms.Je:=('J''' + lowercase(copy(t_chaine,premier_Car,length(t_chaine)-1)))
	ELSE
		Pronoms.Je:=lowercase(copy(t_chaine,1,length(t_chaine)-1));
	test_chaine:=lowercase(copy(t_chaine,length(t_chaine)-2,3));
	CASE test_chaine OF
		'ger':Pronoms.Nous:=lowercase(copy(t_chaine,premier_Car,length(t_chaine)-1)+'ons');
		'cer':Pronoms.Nous:=lowercase(copy(t_chaine,premier_Car,length(t_chaine)-3)+'ons');
	ELSE
		Pronoms.Nous:=lowercase(copy(test_chaine,premier_Car,length(test_chaine)-1) + 'ons')
	END;
	test_chaine:=lowercase(t_chaine);
	Pronoms.Tu:=lowercase(copy(test_chaine,premier_Car,length(test_chaine)-1) + 's');
	Pronoms.Il:=lowercase(copy(test_chaine,premier_Car,length(test_chaine)-1) + 't');
	Pronoms.Vous:=lowercase(copy(test_chaine,premier_Car,length(test_chaine)-1) + 'z');
	Pronoms.Ils:=lowercase(copy(test_chaine,premier_Car,length(test_chaine)-1) + 'nt');
END;

PROCEDURE Conjug_2eme(t_chaine:STRING);

{BUT: Conjuguer un verbe du deuxième groupe
ENTREES: Chaine de caractères
SORTIES: Assignation des variables pronoms personnels}

	VAR
		test_chaine:STRING;

BEGIN
	Pronoms.Je:=(copy(test_chaine,premier_Car,length(test_chaine)-1) + 's');
	Pronoms.Tu:=(copy(test_chaine,premier_Car,length(test_chaine)-1) + 's');
	Pronoms.Il:=(copy(test_chaine,premier_Car,length(test_chaine)-1) + 't');
	Pronoms.Nous:=(copy(test_chaine,premier_Car,length(test_chaine)-1) + 'ssons');
	Pronoms.Vous:=(copy(test_chaine,premier_Car,length(test_chaine)-1) + 'ssez');
	Pronoms.Ils:=(copy(test_chaine,premier_Car,length(test_chaine)-1) + 'ssent');
END;

PROCEDURE Conjug_3eme(t_chaine:STRING);

{BUT:
ENTREES:
SORTIES:}

BEGIN
END;

FUNCTION Conjugaison(t_chaine:STRING):Verbe;

{BUT: Appeler la procédure de conjugaison correspondante en fonction du résultat du test de groupe
ENTREES: Chaine de caractères
SORTIES: Appels des procédures correspondantes}

BEGIN
	IF Verbe_1er(t_chaine) THEN
		BEGIN
			Conjugaison:=premier;
			Conjug_1er(t_chaine);
		END
	ELSE
		BEGIN
			IF Verbe_2eme(t_chaine) THEN
				BEGIN
					Conjugaison:=deuxieme;
					Conjug_2eme(t_chaine);
				END
			ELSE
				BEGIN
					Conjugaison:=troisieme;
					Conjug_3eme(t_chaine);
				END;
		END;
END;




PROCEDURE Afficher_fichier(var t_F:TEXTFILE);

{BUT: Afficher le contenu d'un fichier texte
ENTREES: Fichier texte
SORTIES: Affichage contenu fichier texte}

	VAR
		test_chaine:STRING;

BEGIN
	RESET(t_F);
		WHILE NOT Eof(t_F) DO
			BEGIN
				readln(t_F,test_chaine);
				writeln(test_chaine);
			END;
	CLOSE(t_F);
END;

PROCEDURE Init_Pronoms;

{BUT: Initialiser les pronoms de la variable globale Pronoms 
ENTREES: /
SORTIES: Assignation pronoms}

BEGIN
	Pronoms.Je:=('Je ');
	Pronoms.Tu:=('Tu ');
	Pronoms.Il:=('Il ');
	Pronoms.Nous:=('Nous ');
	Pronoms.Vous:=('Vous ');
	Pronoms.Ils:=('Ils ');
END;

PROCEDURE Init(var t_liste:tab_verbe);

{BUT: Initialiser la liste de verbes en paramètres
ENTREES: Variable de type tab_verbe
SORTIES: Paramètre var}

BEGIN
	liste[1]:='RIRE';
	liste[2]:='RECEVOIR';
	liste[3]:='ALLER';
	liste[4]:='BOUILLIR';
	liste[5]:='ENVOYER';
	liste[6]:='PEINDRE';
	liste[7]:='HABITER';
	liste[8]:='PAYER';
	liste[9]:='MOURIR';
	liste[10]:='HAIR';
	liste[11]:='VOULOIR';
	liste[12]:='FINIR';
	liste[13]:='S''AMUSER';
END;

PROCEDURE Ecriture_Init(var t_F:TEXTFILE);

{BUT: Ecrire dans un fichier entré en paramètres les verbes constants ci-dessous
ENTREES: Fichier ouvert de type Texte
SORTIES: Ecriture dans le fichier ouvert}

	VAR
		i:INTEGER;

BEGIN
	FOR i := 1 TO nb_verbes DO
		BEGIN
			writeln(t_F,liste[i] + CHR(RetourLigne));
		END;
END;

PROCEDURE Init_1;

{BUT: Initialiser un fichier en l'ouvrant avec la méthode d'écriture AJOUT
ENTREES:	/
SORTIES: Appel de la procédure Ecriture_Init}

BEGIN
	APPEND(F);
	Ecriture_Init(F);
	CLOSE(F);
END;

PROCEDURE Init_2;

{BUT: Initialiser un fichier en l'ouvrant avec la méthode REECRITURE
ENTREES:	/
SORTIES: Appel de la procédure Ecriture_Init}

BEGIN
	REWRITE(F);
	Ecriture_Init(F);
	CLOSE(F);
END;



VAR
	i:INTEGER;
BEGIN
	ASSIGN(F,CheminAcces);
	ASSIGN(Conj,CheminAcces3);
	REWRITE(Conj);
	CLOSE(Conj);
	Init(liste);
	IF FileExists('F.txt') THEN// Fonction qui vérifie si le fichier existe sur le disque ou non
		Init_1
	ELSE
		Init_2;
	FOR i := 1 TO nb_verbes DO
		BEGIN
			readln;
			Init_Pronoms;
			CASE Conjugaison(liste[i]) OF
				premier:writeln('Verbe du premier groupe');
				deuxieme:writeln('Verbe du deuxième groupe');
				troisieme:writeln('Verbe du troisième groupe');
			END;
			APPEND(Conj);
				write(Conj,Pronoms.Je + CHR(RetourLigne));
				write(Conj,Pronoms.Tu+ CHR(RetourLigne));
				write(Conj,Pronoms.Il+ CHR(RetourLigne));
				write(Conj,Pronoms.Nous+ CHR(RetourLigne));
				write(Conj,Pronoms.Vous+ CHR(RetourLigne));
				write(Conj,Pronoms.Ils+ CHR(RetourLigne));
			CLOSE(Conj);
			Afficher_fichier(Conj);
		END;
END.