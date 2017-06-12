

{

CONST
	max=3
	min=1
	chemin=("C:\Users\Tamen\Desktop\Ludus\TP ALGO\Algos\Morpions\Morpions_Historique.txt");

TYPE
	J=(J0,J1,J2)
	signe=(X,O)
	
TYPE
	t_joueur=ENREGISTREMENT
		nom:CHAINE
		first:BOOLEEN
		symbole:signe
		win:ENTIER
		sexe:J
FIN

VAR
	FIN:BOOLEEN
	st,nb_cases,manches:ENTIER
	Grille:TABLEAU[min..max,min..max]DE J
	Joueur:TABLEAU[1..2]DE t_joueur
	f:FICHIER TEXTE
	
PROCEDURE Debut

//BUT: Initialiser le programme pour une nouvelle PARTIE ( Noms joueurs, types, "sexe")

DEBUT
	ECRIRE("Entrez le nom du Joueur 1")
	Joueur[1].sexe<-J1
	LIRE(Joueur[1].nom)
	Joueur[1].win<-0
	ECRIRE("Entrez le nom du Joueur 2")
	Joueur[2].sexe<-J2
	LIRE(Joueur[2].nom)
	Joueur[2].win<-0
	ECRIRE("Nombre de manches")
	LIRE(manches)
FIN

	
PROCEDURE Init

//BUT: Initialiser le programme pour une nouvelle manche( joueurs, et grille)

VAR
	commande:1..2
	i,j:ENTIER
DEBUT
	FIN<-FALSE
	nb_cases<-0
	st<-ALEATOIRE(2)+1
	Joueur[st].first<-VRAI
	ECRIRE(Joueur[st].nom & " commence")
	ECRIRE("Le joueur 1 prend quel symbole ? ( 1=RONDS ; 2=CROIX)")
	LIRE(commande)
	CAS commande PARMI
		1:Joueur[2].symbole<-O
		2:Joueur[1].symbole<-X
	FIN CAS PARMI
	SI Joueur[2].symbole=X ALORS
		Joueur[1].symbole<-O
	SINON
		Joueur[1].symbole<-X
	FIN SI
	POUR i DE min A max FAIRE
		POUR j DE min A max FAIRE
			Grille[i,j]<-J0
		FIN POUR
	FIN POUR	
FIN

FONCTION VerifCase(t_J:J):BOOLEEN

//BUT: Vérifier si une case est déjà occupée 

VAR
	test:BOOLEEN
DEBUT
	test<-FAUX
	SI t_J<>J0 ALORS
		test<-VRAI
	FIN SI
	VerifCase<-test
FIN

FONCTION VerifAlign(t_J:J):BOOLEEN

//BUT : Vérifier un alignement pour le jouer en paramètre, diagonale, colonne et ligne

VAR
	i,j,c:ENTIER
	test_l,test_c:BOOLEEN
DEBUT
	test_c<-FAUX
	test_l<-FAUX
	i<-0
	REPETER
	i<-i+1
	j<-0
		REPETER
			j<-j+1
			SI Grille[j,i]<>t_J ALORS
				test_l<-FAUX
			FIN SI
			SI (j=1) ET (test_l) ALORS
				c<-1
					REPETER
						c<-c+1
						SI Grille[c,c]<>t_J ALORS
							test_c<-FAUX
					JUSQU'A (c=max) OU (test_c=FAUX)
			FIN SI
			SI (i=max) ET (test_l) ALORS
				c<-max
					REPETER
						c<-c-1
						SI Grille[c,c]<>t_J ALORS
							test_c<-FAUX
					JUSQU'A (c=1) OU (test_c=FAUX)
			FIN SI
		JUSQU'A (j=max) OU (test_l=FAUX) OU (test_c)
		SI  test_l ALORS
				test_l<-VRAI
				j<-0
				REPETER
					j<-j+1
					SI Grille[i,j]<>t_J ALORS
						test_l<-FAUX
				JUSQU'A (j=max) OU (test_l=FAUX) OU (test_c)
		FIN SI
	JUSQU'A ((test_l) OU (i=max))
	VerifAlign<-(test_l) 
FIN


PROCEDURE Jeu(jouant:t_joueur)
VAR
	coord_x,coor_y:min..max
DEBUT
	ECRIRE("Quelle case jouez-vous ?")
	REPETER
		ECRIRE("Colonne")
		LIRE(coord_x)
		ECRIRE("Ligne")
		LIRE(coord_y)
			SI VerifCase(Grille[coord_x,coord_y]) ALORS
				ECRIRE("Pas possible")
			FIN SI
	JUSQU'A VerifCase(Grille[coord_x,coord_y])=FAUX
	Grille[coord_x,coord_y]<-jouant.sexe
	nb_cases<-nb_cases+1
	SI (nb_cases>=5) ET VerifAlign(jouant.sexe) ALORS
		ECRIRE("Victoire de ",jouant.nom)
			jouant.win<-jouant.win+1
			FIN<-VRAI
			AJOUTER(f)
				ECRIRE
				ECRIRE(f,"Victoire de ",jouant.nom)
				ECRIRE(f,TimeToStr(Time))		//Détermine l'heure actuelle en chaine de caractères
			FERMER(f)
	FIN SI
FIN		
	
	
PROCEDURE Affichage(t_joueur1,t_joueur2:t_joueur)
VAR
	i,j:ENTIER
DEBUT
	ECRIRE
	POUR i<-1 A max FAIRE
		POUR j<-1 A max FAIRE
			SI(Grille[i,j])=J1 ALORS
				CAS t_joueur1.symbole PARMI
					X:ECRIRE("X|")
					O:ECRIRE("O|")
			SINON
			SI (Grille[i,j])=J2 ALORS
				CAS t_joueur2.symbole PARMI
					X:ECRIRE("X|")
					O:ECRIRE("O|")
				FIN CAS PARMI
			SINON
				ECRIRE(" |")
		FIN POUR
		POUR j<-1 A max FAIRE
			ECRIRE("__")
		FIN POUR
	FIN POUR
FIN
	
	
	
PROCEDURE Victoire(j1,j2:t_joueur)

//BUT : Déterminer l'état de la fin d'une partie complète, égalité, victoire

BEGIN
	AJOUTER(f);
	SI j1.win=j2.win ALORS
		ECRIRE("Egalité")
		ECRIRE(f,"Egalité")
	SINON
		SI (j1.win>j2.win) ALORS
			ECRIRE(j1.nom&" a gagné")
			ECRIRE(j1.win&" gagnées contre "&j2.win)
			ECRIRE(f,j1.nom&" a gagné")
			ECRIRE(f,j1.win&" gagnées contre "&j2.win)
		SINON
			ECRIRE(j2.nom&" a gagné")
			ECRIRE(j2.win&" gagnées contre "&j1.win)
			ECRIRE(f,j2.nom&" a gagné")
			ECRIRE(f,j2.win&" gagnées contre "&j1.win)
		FIN SI
	FIN SI
	FERMER(f)
FIN
	
	
VAR
	commande:1..2
	Joueur1,Joueur2:t_joueur
	i:ENTIER
	
DEBUT
	ASSIGN(f,chemin)
	SI FileExists("Morpions_Historique") ALORS		//Fonction de vérification si un fichier existe
		Lecture(f)
	SINON
		REWRITE(f)
		CLOSE(f)
		ECRIRE('Première partie donc, c''est parti')
	Debut
	Init
	POUR i DE 1 A manches FAIRE
		ECRIRE('Manche ' & i)
			REPETER
				Joueur1<-Joueur[1]
				Joueur2<-Joueur[2]
				CAS Joueur[1].First PARMI
					VRAI:
						DEBUT
							Jeu(Joueur1)
							Affichage(Joueur1,Joueur2)
								SI FIN<>VRAI ALORS
									Jeu(Joueur2)
									Affichage(Joueur1,Joueur2)
						FIN
				PAR DEFAUT
					Jeu(Joueur2)
						Affichage(Joueur2,Joueur1)
							SI FIN<>VRAI ALORS
								Jeu(Joueur1)
								Affichage(Joueur2,Joueur1)
							FIN
				FIN CAS PARMI
			JUSQU'A (FIN) OU (nb_cases=max*max)
		AJOUTER(f)
			ECRIRE(f,Joueur1.nom&" : "&Joueur1.win&" manches gagnées ")
			ECRIRE(f,Joueur2.nom&" : "&Joueur2.win&" manches gagnées ")
		FERMER(f)
	FIN POUR
	Victoire(Joueur1,Joueur2)
FIN.
		
}



PROGRAM Morpion;

uses crt, sysutils;

CONST
	max=3;
	min=1;
	chemin=('Morpions_Historique.txt');     //Crée un fichier à l'emplacement du .PAS
	
TYPE 
	J=(J0,J1,J2);
	signe=(X,O);
	
TYPE
	t_joueur=RECORD
		nom:STRING;
		first:BOOLEAN;
		symbole:signe;
		win:INTEGER;
		sexe:J;
END;

VAR
	FIN:BOOLEAN;
	st,nb_cases,manches:INTEGER;
	Grille:ARRAY[min..max,min..max]OF J;
	Joueur:ARRAY[1..2]OF t_joueur;
	f:TEXTFILE;

PROCEDURE Debut;
BEGIN
	writeln('Entrez le nom du Joueur 1');
	Joueur[1].sexe:=J1;
	readln(Joueur[1].nom);
	Joueur[1].win:=0;
	writeln('Entrez le nom du Joueur 2');
	Joueur[2].sexe:=J2;
	readln(Joueur[2].nom);
	Joueur[2].win:=0;
	writeln('Nombre de manches');
	readln(manches);
END;
	
PROCEDURE Init;
VAR
	commande:1..2;
	i,j:INTEGER;
BEGIN
	FIN:=FALSE;
	nb_cases:=0;
	st:=random(2)+1;
	Joueur[st].first:=TRUE;
	writeln(Joueur[st].nom,' commence');
	writeln(Joueur[1].nom,' prend quel symbole ?( 1=RONDS ; 2=CROIX)');
	readln(commande);
		CASE commande OF
			1:Joueur[2].symbole:=O;
			2:Joueur[1].symbole:=X;
		END;
		IF Joueur[2].symbole=X THEN
			Joueur[1].symbole:=O
		ELSE
			Joueur[1].symbole:=X;
		FOR i:=min TO max DO
			BEGIN
				FOR j:=min TO max DO
					BEGIN
						Grille[i,j]:=J0;
					END;
			END;
END;

FUNCTION VerifCase(t_J:J):BOOLEAN;
VAR
	test:BOOLEAN;
BEGIN
	test:=FALSE;
	IF t_J<>J0 THEN
		test:=TRUE;
	VerifCase:=test;
END;

FUNCTION VerifAlign(t_J:J):BOOLEAN;
VAR
		i,j,c:INTEGER;
		test_l,test_c:BOOLEAN;
BEGIN
	test_l:=TRUE;
	test_c:=TRUE;
	i:=0;
	REPEAT
	i:=i+1;
	j:=0;
		REPEAT
			j:=j+1;
			IF Grille[j,i]<>t_J THEN
				BEGIN
					test_l:=FALSE;																// allumez le feu
				END;
			IF (j=1) AND (test_l) THEN															// il suffirait d'une étincelle
				BEGIN
					c:=1;
					REPEAT
						c:=c+1;
						IF Grille[c,c]<>t_J THEN
							BEGIN
								test_c:=FALSE;
							END;
					UNTIL (c=max) OR (test_c=FALSE);
				END;
			IF (i=max) AND (test_l) THEN
				BEGIN
					c:=max;
					REPEAT
						c:=c-1;
						IF Grille[c,c]<>t_J THEN
							BEGIN
								test_c:=FALSE;
							END;
					UNTIL (c=1) OR (test_c=FALSE);
				END;
		UNTIL (j=max) OR (test_l=FALSE) OR (test_c);
		IF NOT test_l THEN
			BEGIN
				test_l:=TRUE;
				j:=0;
				REPEAT
					j:=j+1;
					IF Grille[i,j]<>t_J THEN
						BEGIN
							test_l:=FALSE;
						END;
				UNTIL (j=max) OR (test_l=FALSE) OR (test_c);
			END;
	UNTIL ((test_l) OR (i=max));
	VerifAlign:=(test_l) ;
END;

PROCEDURE Jeu(var jouant:t_joueur);
VAR
	coord_x,coord_y:min..max;
BEGIN
	writeln('Quelle case jouez-vous ?');
	REPEAT
		writeln('Ligne');
		readln(coord_x);
		writeln('Colonne');
		readln(coord_y);
			IF VerifCase(Grille[coord_x,coord_y]) THEN
				writeln('Pas possible');
	UNTIL VerifCase(Grille[coord_x,coord_y])=FALSE;
	Grille[coord_x,coord_y]:=jouant.sexe;
	nb_cases:=nb_cases+1;
	IF  (nb_cases>=5) AND VerifAlign(jouant.sexe) THEN
		BEGIN
			writeln('Victoire de ',jouant.nom);
			jouant.win:=jouant.win+1;
			FIN:=TRUE;
			APPEND(f);
				writeln;
				writeln(f,'Victoire de ',jouant.nom);
				writeln(f,TimeToStr(Time));
			CLOSE(f);
		END;
	readln;
END;

PROCEDURE Affichage(t_joueur1,t_joueur2:t_joueur);
VAR
	i,j:INTEGER;
BEGIN
	writeln;
	FOR i:=1 TO max DO
	BEGIN
		FOR j:=1 TO max DO
		BEGIN
			IF(Grille[i,j])=J1 THEN
				BEGIN
					CASE t_joueur1.symbole OF
						X:write('X|');
						O:write('O|');
					END;
				END
			ELSE
			IF (Grille[i,j])=J2 THEN
				BEGIN
					CASE t_joueur2.symbole OF
						X:write('X|');
						O:write('O|');
					END;
				END
			ELSE
				write(' |');
		END;
		writeln;
		FOR j:=1 TO max DO
		BEGIN
			write('__');
		END;
		writeln;
	END;
		
END;

PROCEDURE Victoire(j1,j2:t_joueur);
BEGIN
	APPEND(f);
	IF j1.win=j2.win THEN
		BEGIN
			writeln('Egalité');
			writeln(f,'Egalité');
		END
	ELSE
		IF j1.win>j2.win THEN
			BEGIN
				writeln(j1.nom,' a gagné');
				writeln(j1.win,' gagnées contre ',j2.win);
				writeln(f,j1.nom,' a gagné');
				writeln(f,j1.win,' gagnées contre ',j2.win);
			END
		ELSE
			BEGIN
				writeln(j2.nom,' a gagné');
				writeln(j2.win,' gagnées contre ',j1.win);
				writeln(f,j2.nom,' a gagné');
				writeln(f,j2.win,' gagnées contre ',j1.win);
			END;
	CLOSE(f);
END;	


PROCEDURE Lecture(var t_file:TEXTFILE);
VAR
	t_chaine:STRING;
BEGIN
	RESET(t_file);
		WHILE NOT(Eof) DO
			BEGIN
				readln(t_file,t_chaine);
				writeln(t_chaine);
			END;
	CLOSE(t_file);
END;
	
VAR
	commande:1..2;
	Joueur1,Joueur2:t_joueur;
	i:INTEGER;
	
BEGIN
	clrscr;
	ASSIGN(f,chemin);
	IF FileExists('Morpions_Historique') THEN
		BEGIN
			Lecture(f);
		END
	ELSE
		BEGIN
			REWRITE(f);
			CLOSE(f);
			writeln('Première partie donc, c''est parti');
		END;
	Debut;
	Init;
	FOR i:=1 TO manches DO
		BEGIN
			writeln('Manche ',i);
			REPEAT
				clrscr;
				Joueur1:=Joueur[1];
				Joueur2:=Joueur[2];
				CASE Joueur[1].First OF
					TRUE:
						BEGIN
						Jeu(Joueur1);
						Affichage(Joueur1,Joueur2);
							IF FIN<>TRUE THEN
							BEGIN
								Jeu(Joueur2);
								Affichage(Joueur1,Joueur2);
								readln;
							END;
						END;
				ELSE
					Jeu(Joueur2);
						Affichage(Joueur2,Joueur1);
							IF FIN<>TRUE THEN
							BEGIN
								Jeu(Joueur1);
								Affichage(Joueur2,Joueur1);
								readln;
							END;
				END;
			UNTIL (FIN) OR (nb_cases=max*max);
			APPEND(f);
				writeln(f,Joueur1.nom,' : ',Joueur1.win,' manches gagnées ');
				writeln(f,Joueur2.nom,' : ',Joueur2.win,' manches gagnées ');
				writeln;
			CLOSE(f);
			readln;
	END;
	Victoire(Joueur1,Joueur2);
END.