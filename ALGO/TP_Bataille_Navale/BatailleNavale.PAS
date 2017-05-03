{
//ALGO: BatailleNavale
//BUT: Programme de bataille navale sans utilisation de tableau pour la grille et le placement des bateaux.
//ENTREES: Coordonnées, direction, confirmation
//SORTIES:	Affichage grille+bateaux, consignes

© GUILLAUME ALVES, C'EST A MOI ®  ©GUILLAUME ALVES, C'EST A MOI ®  ©GUILLAUME ALVES, C'EST A MOI ®  ©GUILLAUME ALVES, C'EST A MOI ®  ©GUILLAUME ALVES, C'EST A MOI ®  ©GUILLAUME ALVES, C'EST A MOI ®  ©GUILLAUME ALVES, C'EST A MOI ®


TYPE
	coord=ENREGISTREMENT
		x,y:ENTIER
FIN

TYPE
	bateau=ENREGISTREMENT
		cases:tableau[1..5] DE coord
		taille:ENTIER
FIN

TYPE 
	flotte=ENREGISTREMENT
		boat:tableau[1..5] DE bateau
		joueur,restants:ENTIER
FIN

CONST
	max=20
	
FONCTION BateauHorsLimites(bateau1:bateau) DE BOOLEEN 										// Retourne un booléen qui vérifie si le bateau en paramètre est hors limites ou pas
			VAR
				i:ENTIER
						DEBUT
							BateauHorslimites<-FAUX											//Initialisation
							POUR i DE 1 A (bateau1.taille) FAIRE							//Pour chaque cellule du bateau en paramètre
								SI (bateau1.cases[i].x<1) OU (bateau1.cases[i].y<1) OU (bateau1.cases[i].y>max) OU (bateau1.cases[i].x>max) ALORS
									//Si les coordonnées du bateau sont en dehors de l'intervalle, alors la fonction retourne VRAI
									BateauHorsLimites<-VRAI
								FIN SI
							FIN POUR
						FIN
											
											
FONCTION Comparaison(coord1,coord2:coord) DE BOOLEEN										// Retourne un booléen qui vérifie si deux coordonnées (cellules) sont égales
						DEBUT
							Comparaison<-FAUX												// Initialisation
								SI (coord1.x=coord2.x) ET (coord1.y=coord2.y) ALORS		 
									Comparaison<-VRAI										// Si les deux coordonnées sont égales alors la fonction retourne VRAI
								FIN SI
						FIN
FONCTION OwnBateau(bateau1:bateau ; coord1:coord) DE BOOLEEN									//Retourne un booléen qui vérifie si la coordoonée en paramètre appartient au bateau en paramètre
				VAR
					i,j:ENTIER
						DEBUT
							OwnBateau<-FAUX														//Initialisation
							POUR i DE 1 A (bateau1.taille) FAIRE								//Pour chaque cellule du bateau
								SI Comparaison(bateau1.cases[i],coord1)=VRAI ALORS		
									OwnBateau<-VRAI												//Si les coordonnées en paramètres sont égales à la cellule actuelle du bateau (i), alors la fonction retourne VRAI
								FIN SI
							FIN POUR
						FIN
FONCTION OwnFlotte(flotte1:flotte ; coord1:coord) DE BOOLEEN									// Retourne un booléen qui vérifie si un bateau de la flotte en paramètre possède les coordonnées entrées en paramètre
				VAR
					i:ENTIER
						DEBUT
							OwnFlotte<-FAUX														//Initialisation
							POUR i DE 1 A 5														//Pour chaque bateau constituant la flotte
								SI (OwnBateau(flotte1.boat[i],coord1)=VRAI) ALORS
									OwnBateau<-VRAI												//Si les coordonées en paramètres appartiennent au bateau actuel (i), alors la fonction retourne VRAI
								FIN SI
							FIN POUR
						FIN
						
FONCTION Crea DE coord
						DEBUT
							REPETER																//Répéter jusqu'à ce que les coordonées soient valides
								LIRE(Crea.x,Crea.y)												//Répéter jusqu'à ce que les coordonées soient valides
									SI (Crea.x<1) OU (Crea.y<1) OU (Crea.x>max) OU (Crea.y>max) ALORS
										ECRIRE("Erreur")										//Si les coordonnées ne sont pas valides (en dehors des dimensions) alors le programme affiche "Erreur"
							JUSQU'A (Crea.x>=1) ET (Crea.x<=max) ET (Crea.y>=1) ET (Crea.y<=max)
						FIN
FONCTION CreaBateau(compteur:ENTIER ; bateau1:bateau ; flotte1:flotte): Bateau					//Placer correctement un bateau en fonction des coordonnées et de la direction entrées par l'utilisateur
				VAR
					i:ENTIER
					direction:CARACTERE
					stockcoord:coord
					troll,troll2:BOOLEEN
						DEBUT
							REPETER																//Répéter la création du bateau jusqu'à ce que son positionnement valide
								troll<-FAUX 													//Initialisation
								ECRIRE("Entrez les coordonnées de votre bateau de longueur " & flotte1.boat[compteur].taille & " (comprises entre 1 et " & max & ")")	//Demande à l'utilisateur d'entrer les coordonnées du bateau en fonction de sa taille (compteur) 
								ECRIRE("Dans cet ordre: Abscisse, Ordonnée")
								stockcoord<-Crea												//Lecture des coordonnées entrées par l'utilisateur
								CreaBateau<-bateau1												//La fonction récupère les valeurs des différents attributs du bateau en paramètre
								REPETER															//Répéter jusqu'à ce que la valeur soit valide
									ECRIRE("Entrez l'orientation de votre bateau")				//Demande de l'orientation du bateau actuel à l'utilisateur avec un caractère
									ECRIRE("NORD (N) ; EST (E) ; SUD (S) ; OUEST (O)")
									LIRE(direction)
								JUSQU'A (direction="N") OU (direction="E") OU (direction="S") OU (direction="O")
									POUR i DE 1 A CreaBateau.taille FAIRE  						//Pour chaque cellule de la fonction CreaBateau 								
										CAS direction PARMI										//En fonction de la direction choisie, les coordonnées de la cellule actuelle (i en incrémentation) sont modifiées
											"S":
												(CreaBateau.cases[i].x)<-(stockcoord.x)
												(CreaBateau.cases[i].y)<-(stockcoord.y+i-1)			//Vers le bas (+i-1 Pour partir des coordoonées entrées)
											"E":
												(CreaBateau.cases[i].x)<-(stockcoord.x+i-1) 		//Vers la droite (+i-1 Pour partir des coordoonées entrées)
												(CreaBateau.cases[i].y)<-(stockcoord.y)
											"N":
												(CreaBateau.cases[i].x)<-(stockcoord.x)		
												(CreaBateau.cases[i].y)<-(stockcoord.y-i+1)			//Vers le haut (-i+1 Pour partir des coordoonées entrées)
											"O":
												(CreaBateau.cases[i].x)<-(stockcoord.x-i+1)			//Vers la gauche (-i+1 Pour partir des coordoonées entrées)
												(CreaBateau.cases[i].y)<-(stockcoord.y)
										FIN CASPARMI
											SI OwnFlotte(flotte1,CreaBateau.cases[i])=VRAI ALORS	
												troll<-VRAI										//Si la cellule actuelle (i) du bateau CreaBateau appartient déjà un autre bateau de la flotte, alors troll retourne VRAI
											FIN SI
									FIN POUR
								SI (BateauHorsLimites(CreaBateau)=VRAI) ALORS
									troll2<-VRAI												//Si le bateau positionné est hors limite, alors demande de recommencer la saisie et troll2 retourne VRAI
									ECRIRE("Bateau hors limites, recommencez")
								SINON
									troll2<-FAUX
								FIN SI
								SI (troll=VRAI) ALORS
									ECRIRE("Superposition impossible, recommencez")				//En dehors de la boucle POUR, pour ne pas réafficher le message à chaque incrémentation
								FIN SI
							JUSQU'A (i=CreaBateau.taille) ET (troll=FAUX) ET (troll2=FAUX)
						FIN

FONCTION NettoyageFlotte(flotte1:flotte) DE flotte												//Nettoyer/Initialiser les cellules de toute la flotte en paramètre
				VAR
					i,j:ENTIER
						DEBUT
							NettoyageFlotte<-flotte1											//La fonction NettoyageFlotte récupère les valeurs de la flotte en paramètre
							POUR i DE 1 A 5 FAIRE												//Pour chaque bateau de la flotte
								POUR j DE 1 A NettoyageFlotte.boat[i].taille FAIRE				//Pour chaque cellule du bateau actuel (i)
									NettoyageFlotte.boat[i].cases[j].x<-0						//Les coordonnées de la cellule actuelle (j) prennent la valeur 0
									NettoyageFlotte.boat[i].cases[j].y<-0
								FIN POUR
							FIN POUR
						FIN
						
PROCEDURE AffichageTableau(flotte1:flotte)														//Afficher la grille de jeu avec les axes x,y et les bateaux s'il y en a
				VAR
					i,j:ENTIER
					stockcoord:coord
						DEBUT
							POUR i DE 0 A max FAIRE												//Pour chaque case de la grille y compris 0 (origine)
								POUR j DE 0 A max FAIRE											//Pour chaque case de la grille y compris 0 (origine)
									stockcoord.x<-j												//Stocker les valeurs des compteurs pour les utiliser dans la vérification ci-dessous
									stockcoord.y<-i		
										SI (i=0) ALORS											//Pour la première ligne, affichage du numéro des colonnes (j)
											SI (j>9) ALORS										//Formalité d'affichage pour équilibrer les espaces entre les chiffres et les nombres
												ECRIRE(" " & j)
											SINON
												ECRIRE("  " & j)
											FIN SI
										SINON
											SI (j=0) ALORS										//Pour la première colonne, affichage du numéro des lignes (i)
												SI (i>9) ALORS									//Formalité d'affichage pour équilibrer les espaces entre les chiffres et les nombres
													ECRIRE(" ",i," ")
												SINON
													ECRIRE("  ",i," ")
												FIN SI
											SINON
												SI (OwnFlotte(flotte1,stockcoord)=VRAI) ALORS
													ECRIRE(" ",CHR(129)," ")					//Si aux coordonnées des valeurs actuelles des compteurs (i,j) se trouve un bateau de la flotte, alors affichage d'un carré
												SINON											//Sinon afficher des points
													ECRIRE(" . ")
												FIN SI
											FIN SI
										FIN SI
								FIN POUR
								//Retour à la ligne pour affichage
							FIN POUR
	
FONCTION InitFlotte DE flotte																	//Attribution la flotte de chaque joueur
				VAR
					i,j:ENTIER
						DEBUT
							POUR i DE 1 A 5 FAIRE												// Pour chaque bateau de InitFlotte, la taille est attribuée en fonction du compteur
								CAS i PARMI
									1:InitFlotte.boat[i].taille<-2								// Exceptions pour 1 et 2 car il faut 2 bateaux de longueur 3 et le plus petit bateau est de longueur 2
									2:InitFlotte.boat[i].taille<-3
								CAS PAR DEFAUT
									InitFlotte.boat[i].taille<-i
								FIN CAS PARMI
							FIN POUR
								InitFlotte<-NettoyageFlotte(InitFlotte)							//Nettoyage/Initialisation
							POUR i DE 1 A 5 FAIRE												//Après attribution des tailles, pour chaque bateau de la flotte
								InitFlotte.boat[i]<-(CreaBateau(i,InitFlotte.boat[i],InitFlotte)) //Le bateau actuel (i) récupère la valeur de la fonction CreaBateau
								AffichageTableau(InitFlotte)									//Affichage de la grille 
							FIN POUR
						FIN
						
FONCTION BateauCoulé(bateau1:bateau) DE ENTIER													//Retourner un entier qui permettra de comparer la taille du bateau avec le nombre de ses cellules touchées
				VAR
					i:ENTIER
						DEBUT
							BateauCoulé<-0														//Initialisation
							POUR i DE 1 A bateau1.taille FAIRE									//Pour chaque cellule du bateau en paramètre
								SI (bateau1.cases[i].x=0) ET (bateau1.cases[i].y=0) ALORS		
									BateauCoulé<-BateauCoulé+1									//Si les coordonnées de la cellule actuelle (i) valent 0, alors incrémentation de BateauCoulé
									//NOTE: Lorsque qu'une cellule est touchée, ses coordonnées sont redéfinies à 0,0 puis -1,-1 (Pour les exclure)
								FIN SI
							FIN POUR
						FIN
						
FONCTION Défaite(flotte1:flotte) DE BOOLEEN														//Booléen qui vérifie si un joueur a perdu
				VAR
					i,j,stock:ENTIER
						DEBUT
							sotck<-0															//Initialisation
							POUR i DE 1 A 5 FAIRE												//Pour chaque bateau de la flotte en paramètre
								POUR j DE 1 A flotte1.boat[i].taille FAIRE						//Pour chaque cellule du bateau (i) 
									SI (flotte1.boat[i].cases[j].x=-1) ET (flotte1.boat[i].cases[j].y=-1)	// Si les coordonnées sont -1,-1
										stock<-stock+1												//Incrémentation du stock 
									FIN SI
								FIN POUR
							FIN POUR
								SI (stock=5) ALORS													// Si le stock s'est incrémenté 5 fois, autant que le nombre de bateaux dans la flotte en question
									Défaite<-VRAI													// Alors Défaite retourne VRAI et le joueur en question a perdu
									ECRIRE("Le joueur " & flotte1.joueur & " a perdu")
								SINON
									Défaite<-FAUX
								FIN SI
						FIN
			
PROCEDURE TourDeJeu(flotte1:flotte ; var flotte2:flotte)											//Lire les coordonnées du tir du joueur et agir en conséquence
				VAR
					i,j:ENTIER
					stockcoord:coord
						DEBUT
							AffichageTableau(flotte1)												//Afficher la grille de la flotte du joueur qui joue son tour (Lui montrer ce qu'il lui reste)
							ECRIRE("Vos ordres " & flotte1.joueur)
							ECRIRE("Entrez les coordonnées de votre tir")
							ECRIRE("Ordre: Abscisse, Ordonnée")
							stockcoord<-Crea																	//Lire les coordonnées
								SI OwnFlotte(flotte2,stockcoord)=VRAI Alors										// Si les coordonnées touchent un bateau de la flotte ennemie alors
									ECRIRE("Touché !")
									POUR i DE 1 A 5 FAIRE														//Relancement du même genre de boucle pour stocker le numéro bateau touché.		 Pour chaque bateau de cette flotte
										POUR i DE 1 A flotte2.boat[i].taille FAIRE								//Pour chaque cellule du bateau actuel (i)
											SI (Comparaison(flotte2.boat[i].cases[j],stockcoord)=VRAI) ALORS	//Lorsque le bateau concerné est atteint dans la boucle
												flotte2.boat[i].cases[j].x<-0									//Réattribution de ses coordonnées en 0,0
												flotte2.boat[i].cases[j].y<-0
											FIN SI
											SI (BateauCoulé(flotte2.boat[i])=flotte2.boat[i].taille) ALORS		// Si la fonction BateauCoulé retourne la même valeur que la taille du bateau concerné, alors
												ECRIRE("Coulé !")
												flotte2.restants<-(flotte2.restants-1)							//Décrémenter le nombre restant de bateaux				
												flotte2.boat[i].cases[j].x<- -1									
												flotte2.boat[i].cases[j].y<- -1									// Attrbution des coord du bateau coulé en valeurs négatives pour ne pas qu'elles confirment une deuxième fois le booléen d'un bateau coulé
											FIN SI
										FIN POUR
									FIN POUR
								SINON
									ECRIRE("Manqué !")
								FIN SI
							POUR i DE 0 A max FAIRE										//Pour chaque case de la grille y compris 0 (origine)
								POUR j DE 0 A max FAIRE									//Pour chaque case de la grille y compris 0 (origine)
										SI (i=0) ALORS									//Pour la première ligne, affichage du numéro des colonnes (j)
											SI (j>9) ALORS								//Formalité d'affichage pour équilibrer les espaces entre les chiffres et les nombres
												ECRIRE(" " & j)
											SINON
												ECRIRE("  " & j)
											FIN SI
										SINON
											SI (j=0) ALORS								//Pour la première colonne, affichage du numéro des lignes (i)
												SI (i>9) ALORS							//Formalité d'affichage pour équilibrer les espaces entre les chiffres et les nombres
													ECRIRE(" ",i," ")
												SINON
													ECRIRE("  ",i," ")
												FIN SI
											SINON
												SI (stockcoord.x=j) ET stockcoord.y=i) ALORS
													ECRIRE(" ",CHR(64)," ")					//Ecrire aux coordonnées du tir du joueur sur la grille un caractère spécifique pour signaler l'emplacement de son tir
												SINON											//Sinon afficher des points
													ECRIRE(" . ")
												FIN SI
											FIN SI
										FIN SI
								FIN POUR
								//Retour à la ligne pour affichage
							FIN POUR
							ECRIRE("Votre adversaire possède encore ",flotte2.restants," bateau(x). Entrez pour continuer")
						FIN
						
VAR
	flotte1,flotte2:flotte
	i,j:ENTIER
	Confirm:STRING
BEGIN
	clrscr
	ECRIRE("Bienvenue dans le programme de bataille navale")
	ECRIRE("Pour que vous compreniez le système voici comment est représentée la grille:")
	NettoyageFlotte(flotte1)																		//Initialisation de la flotte
	AffichageTableau(flotte1)																		//Affichage exemple
	ECRIRE
	ECRIRE("Entrez pour commencer la partie")
	REPETER																							//Répéter l'initialisation de la flotte du joueur 1 jusqu'à ce qu'il confirme
		ECRIRE("Joueur 1:")
		flotte1<-InitFlotte
		flotte1.joueur<-1																			//Joueur 1
		flotte1.restants<-5
		ECRIRE("Entrez "OK" pour confirmer")
		LIRE(Confirm)
	JUSQU'A (Confirm="OK")
	REPETER																							//Répéter l'initialisation de la flotte du joueur 2 jusqu'à ce qu'il confirme
		ECRIRE("Joueur 2:")
		flotte2<-InitFlotte
		flotte2.joueur<-2																			//Joueur 2
		flotte2.restants<-5
		ECRIRE("Entrez "OK" pour confirmer")
		LIRE(Confirm)
	JUSQU'A (Confirm="OK")
	REPEAT																							//Répéter le tour de jeu jusqu'à ce qu'un des deux joueurs perde
		TourDeJeu(flotte1,flotte2)
			SI Defaite(flotte2)=FAUX ALORS
				TourDeJeu(flotte2,flotte1)
			FIN SI
	JUSQU'A Defaite(flotte1)=VRAI OU Defaite(flotte2)=VRAI
	
FIN	
			
}

	
PROGRAM BatNavale;

uses crt;


TYPE
	coord=RECORD
		x,y:INTEGER
END;

TYPE
	bateau=RECORD
		cases:ARRAY[1..5] OF coord;
		taille:INTEGER;
END;

TYPE
	flotte=RECORD
		boat:ARRAY[1..5] OF bateau;
		joueur,restants:INTEGER;
END;

CONST
	max=14;
	
FUNCTION BateauHorsLimites (bateau1:bateau) : BOOLEAN;								// Retourne un booléen qui vérifie si le bateau en paramètres est hors limites ou pas
					VAR
						i:INTEGER;
								BEGIN
									BateauHorsLimites:=FALSE;						//Initialisation
									FOR i:=1 TO bateau1.taille DO					//Pour chaque cellule du bateau en paramètre
										IF (bateau1.cases[i].x<1) OR (bateau1.cases[i].y<1) OR (bateau1.cases[i].y>max) OR (bateau1.cases[i].x>max) THEN
																					//Si les coordonnées du bateau sont en dehors de l'intervalle, alors la fonction retourne VRAI
											BateauHorsLimites:=TRUE
								END;
	
	
FUNCTION Comparaison (coord1,coord2:coord) : BOOLEAN;								// Retourne un booléen qui vérifie si deux coordonnées (cellules) sont égales
								BEGIN
									Comparaison:=FALSE;								// Initialisation
									IF (coord1.x=coord2.x) AND (coord1.y=coord2.y) THEN
										Comparaison:=TRUE							// Si les deux coordonnées sont égales alors la fonction retourne VRAI
								END;
								
FUNCTION OwnBateau (bateau1:bateau ; coord1:coord) : BOOLEAN;						//Retourne un booléen qui vérifie si la coordoonée en paramètre appartient au bateau en paramètre
					VAR
						i:INTEGER;
								BEGIN
									OwnBateau:=FALSE;								//Initialisation
									FOR i:=1 TO (bateau1.taille) DO					//Pour chaque cellule du bateau
										IF Comparaison(bateau1.cases[i],coord1)=TRUE THEN//Si les coordonnées en paramètres sont égales à la cellule actuelle du bateau (i), alors la fonction retourne VRAI
											BEGIN
												OwnBateau:=TRUE;
											END; 
										
								END;
								
FUNCTION OwnFlotte (flotte1:flotte ; coord1:coord) : BOOLEAN;						// Retourne un booléen qui vérifie si un bateau de la flotte en paramètre possède les coordonnées entrées en paramètre
					VAR	
						i:INTEGER;
								BEGIN
									OwnFlotte:=FALSE;								//Initialisation
									FOR i:=1 TO 5 DO								//Pour chaque bateau constituant la flotte
										IF (OwnBateau(flotte1.boat[i],coord1)=TRUE) THEN
											BEGIN
												OwnFlotte:=TRUE;					//Si les coordonées en paramètres appartiennent au bateau actuel (i), alors la fonction retourne VRAI
											END;
								END;
	

FUNCTION Crea : coord;
								BEGIN
									REPEAT											//Répéter jusqu'à ce que les coordonées soient valides
										readln(Crea.x,Crea.y);						//Répéter jusqu'à ce que les coordonées soient valides
											IF (Crea.x<1) OR (Crea.y<1) OR (Crea.x>max) OR (Crea.y>max) THEN
												writeln('Erreur')					//Si les coordonnées ne sont pas valides (en dehors des dimensions) alors le programme affiche "Erreur"
									UNTIL (Crea.x>=1) AND (Crea.x<=max) AND (Crea.y>=1) AND (Crea.y<=max);
								END;
								
FUNCTION CreaBateau (compteur:INTEGER ; bateau1:bateau ; flotte1:flotte): Bateau;//Placer correctement un bateau en fonction des coordonnées et de la direction entrées par l'utilisateur
//ENTREES: Valeur compteur représentant le numéro du bateau dans la flotte le possédant, bateau vide, flotte en initialisation
//SORTIES: Affectation des coordonnées de chaque cellule du bateau
					VAR
						i:INTEGER;
						direction:CHAR;
						stockcoord:coord;
						troll,troll2:BOOLEAN;
								BEGIN
									REPEAT															//Répéter la création du bateau jusqu'à ce que son positionnement valide
										troll:=FALSE;												//Initialisation
										writeln('Entrez les coordonnées de votre bateau de longueur ' , flotte1.boat[compteur].taille , ' (comprises entre 1 et ' , max , ')');//Demande à l'utilisateur d'entrer les coordonnées du bateau en fonction de sa taille (compteur) 
										writeln('Ordre: Abscisse, Ordonnée');
										stockcoord:=Crea;											//Lecture des coordonnées entrées par l'utilisateur
										CreaBateau:=bateau1;										//La fonction récupère les valeurs des différents attributs du bateau en paramètre
										REPEAT														//Répéter jusqu'à ce que la valeur soit valide
											writeln('Entrez l''orientation de votre bateau :');		//Demande de l'orientation du bateau actuel à l'utilisateur avec un caractère
											writeln('NORD (N) ; EST (E) ; SUD (S) ; OUEST (O)');
											readln(direction);
										UNTIL (direction='N') OR (direction='E') OR (direction='S') OR  (direction='O');
											FOR i:=1 TO CreaBateau.taille DO						//Pour chaque cellule de la fonction CreaBateau
												BEGIN
														CASE direction OF							//En fonction de la direction choisie, les coordonnées de la cellule actuelle (i en incrémentation) sont modifiées
															'S':
																BEGIN
																	(CreaBateau.cases[i].x):=(stockcoord.x);
																	(CreaBateau.cases[i].y):=(stockcoord.y+i-1);//Vers le bas (+i-1 Pour partir des coordoonées entrées)
																END;
															'E':
																BEGIN
																	(CreaBateau.cases[i].x):=(stockcoord.x+i-1);//Vers la droite (+i-1 Pour partir des coordoonées entrées)
																	(CreaBateau.cases[i].y):=(stockcoord.y);
																END;
															'N':
																BEGIN
																	(CreaBateau.cases[i].x):=(stockcoord.x);
																	(CreaBateau.cases[i].y):=(stockcoord.y-i+1);//Vers le haut (-i+1 Pour partir des coordoonées entrées)
																END;
															'O':
																BEGIN
																	(CreaBateau.cases[i].x):=(stockcoord.x-i+1);//Vers la gauche (-i+1 Pour partir des coordoonées entrées)
																	(CreaBateau.cases[i].y):=(stockcoord.y);
																END;
														END;
															IF OwnFlotte(flotte1,CreaBateau.cases[i])=TRUE THEN
																BEGIN
																	troll:=TRUE;						//Si la cellule actuelle (i) du bateau CreaBateau appartient déjà un autre bateau de la flotte, alors troll retourne VRAI
																END;
												END;
										IF BateauHorsLimites(CreaBateau)=TRUE THEN
																BEGIN
																	troll2:=TRUE;						//Si le bateau positionné est hors limite, alors demande de recommencer la saisie et troll2 retourne VRAI
																	writeln('Bateau Hors limite, recommencez');
																END
																ELSE
																	BEGIN
																		troll2:=FALSE;
																	END;
										IF troll=TRUE THEN
											BEGIN
												writeln('Superposition impossible, recommencez');		//En dehors de la boucle POUR, pour ne pas réafficher le message à chaque incrémentation
											END;
									UNTIL (i=CreaBateau.taille) AND (troll=FALSE) AND (troll2=FALSE);	//Nettoyer/Initialiser les cellules de toute la flotte en paramètre
										
								END;
								


FUNCTION NettoyageFlotte (flotte1:flotte) : Flotte;
				VAR
					i,j:INTEGER;
							BEGIN
								NettoyageFlotte:=flotte1;										//La fonction NettoyageFlotte récupère les valeurs de la flotte en paramètre
								FOR i:=1 TO 5 DO												//Pour chaque bateau de la flotte
									BEGIN
										FOR j:=1 TO NettoyageFlotte.boat[i].taille DO			//Pour chaque cellule du bateau actuel (i)
											BEGIN
												NettoyageFlotte.boat[i].cases[j].x:=0;			//Les coordonnées de la cellule actuelle (j) prennent la valeur 0
												NettoyageFlotte.boat[i].cases[j].y:=0;
											END;
									END;
							END;


PROCEDURE AffichageTableau(flotte1:flotte);			//Afficher la grille de jeu avec les axes x,y et les bateaux s'il y en a
				VAR
					i,j:INTEGER;
					stockcoord:coord;
							BEGIN
								FOR i:=0 TO max DO								//Pour chaque case de la grille y compris 0 (origine)
									BEGIN
											FOR j:=0 TO max DO					//Pour chaque case de la grille y compris 0 (origine)
												BEGIN
												stockcoord.x:=j;				//Stocker les valeurs des compteurs pour les utiliser dans la vérification ci-dessous
												stockcoord.y:=i;
													IF (i=0)THEN				//Pour la première ligne, affichage du numéro des colonnes (j)
														IF j>9 THEN				//Formalité d'affichage pour équilibrer les espaces entre les chiffres et les nombres
															write(' ',j)
														ELSE
															write('  ',j)
													ELSE
														IF (j=0) THEN			//Pour la première colonne, affichage du numéro des lignes (i)
															IF i>9 THEN			//Formalité d'affichage pour équilibrer les espaces entre les chiffres et les nombres
																write(' ',i,' ')
															ELSE
																write('  ',i,' ')
														ELSE
															IF (OwnFlotte(flotte1,stockcoord)=TRUE) THEN
																write(' ',CHR(129),' ')//Si aux coordonnées des valeurs actuelles des compteurs (i,j) se trouve un bateau de la flotte, alors affichage d'un carré
															ELSE				//Sinon afficher des points
																write(' . ')
												END;
										writeln;
									END;
										
							END;

FUNCTION InitFlotte : flotte;//Attribution la flotte de chaque joueur
//SORTIES: Flotte remplie de bateaux positionnés, affichage grille
					VAR
						i,j:INTEGER;
								BEGIN
									FOR i:=1 TO 5 DO// Pour chaque bateau de InitFlotte, la taille est attribuée en fonction du compteur
										BEGIN
											CASE i OF
												1:InitFlotte.boat[i].taille:=2;// Exceptions pour 1 et 2 car il faut 2 bateaux de longueur 3 et le plus petit bateau est de longueur 2
												2:InitFlotte.boat[i].taille:=3;
											ELSE
												InitFlotte.boat[i].taille:=i
											END;
										END;
										InitFlotte:=NettoyageFlotte(InitFlotte);//Nettoyage/Initialisation
									FOR i:=1 TO 5 DO//Après attribution des tailles, pour chaque bateau de la flotte
										BEGIN
											InitFlotte.boat[i]:=(CreaBateau(i,InitFlotte.boat[i],InitFlotte));//Le bateau actuel (i) récupère la valeur de la fonction CreaBateau
											AffichageTableau(InitFlotte);//Affichage de la grille 
										END;
								END;

FUNCTION BateauCoule(bateau1:bateau) : INTEGER;							//Retourner un entier qui permettra de comparer la taille du bateau avec le nombre de ses cellules touchées
					VAR
						i:INTEGER;
								BEGIN
									BateauCoule:=0;//Initialisation
									FOR i:=1 TO bateau1.taille DO//Pour chaque cellule du bateau en paramètre
										IF (bateau1.cases[i].x=0) AND (bateau1.cases[i].y=0) THEN//Si les coordonnées de la cellule actuelle (i) valent 0, alors incrémentation de BateauCoulé
											BateauCoule:=BateauCoule+1
											//NOTE: Lorsque qu'une cellule est touchée, ses coordonnées sont redéfinies à 0,0 puis -1,-1 (Pour les exclure)
								END;
FUNCTION Defaite(flotte1:flotte): BOOLEAN;				//Booléen qui vérifie si un joueur a perdu
					VAR
						i,j,stock:INTEGER;
								BEGIN
									stock:=0;//Initialisation
									FOR i:=1 TO 5 DO										//Pour chaque bateau de la flotte en paramètre
										BEGIN
											FOR j:=1 TO flotte1.boat[i].taille DO//Pour chaque cellule du bateau (i) 
												BEGIN
													IF (flotte1.boat[i].cases[j].x=-1) AND (flotte1.boat[i].cases[j].y=-1) THEN// Si les coordonnées sont -1,-1
														stock:=stock+1//Incrémentation du stock 
												END;
										END;
									IF stock=5 THEN // Si le stock s'est incrémenté 5 fois, autant que le nombre de bateaux dans la flotte en question
										BEGIN
											Defaite:=TRUE;// Alors Défaite retourne VRAI et le joueur en question a perdu
											writeln('Le joueur ',flotte1.joueur,' a perdu');
										END
									ELSE
											Defaite:=FALSE
								END;
								
PROCEDURE TourDeJeu(flotte1:flotte ; var flotte2:flotte);//Lire les coordonnées du tir du joueur et agir en conséquence
//ENTREES: Flotte du joueur attaquant, flotte du joueur attaqué
//SORTIES: Affichage statut de la case (Touché, coulé ou manqué), exclusion des cellules touchées par un tir, affichage tir
					VAR
						i,j:INTEGER;
						stockcoord:coord;
								BEGIN
										AffichageTableau(flotte1);																//Afficher la grille de la flotte du joueur qui joue son tour (Lui montrer ce qu'il lui reste)
										writeln('Ordres du joueur ',flotte1.joueur);
										writeln('Entrez les coordonnées de votre tir');
										writeln('Ordre: Abscisse, Ordonnée');
										stockcoord:=Crea;																			//Lire les coordonnées
													IF OwnFlotte(flotte2,stockcoord)=TRUE THEN										// Si les coordonnées touchent un bateau de la flotte ennemie alors
														BEGIN
															writeln('Touché !');
															FOR i:=1 TO 5 DO														//Relancement du même genre de boucle pour stocker le numéro bateau touché.		 Pour chaque bateau de cette flotte
																BEGIN
																	FOR j:=1 TO flotte2.boat[i].taille DO							//Pour chaque cellule du bateau actuel (i)
																		BEGIN
																			IF (Comparaison(flotte2.boat[i].cases[j],stockcoord)=TRUE) THEN//Lorsque le bateau concerné est atteint dans la boucle
																				BEGIN
																					flotte2.boat[i].cases[j].x:=0;					//Réattribution de ses coordonnées en 0,0
																					flotte2.boat[i].cases[j].y:=0;
																				END;
																			IF (BateauCoule(flotte2.boat[i])=flotte2.boat[i].taille) THEN// Si la fonction BateauCoulé retourne la même valeur que la taille du bateau concerné, alors
																				BEGIN
																					writeln('Coulé !');
																					flotte2.restants:=(flotte2.restants-1);			//Décrémenter le nombre restant de bateaux
																					flotte2.boat[i].cases[j].x:=-1;
																					flotte2.boat[i].cases[j].y:=-1; 				// Attrbution des coord du bateau coulé en valeurs négatives pour ne pas qu'elles confirment une deuxième fois le booléen d'un bateau coulé
																				END;
																		END;
																END;
														END
													ELSE
														BEGIN
															writeln('Manqué !');
														END;
												FOR i:=0 TO max DO
													BEGIN
														FOR j:=0 TO max DO
															BEGIN
																IF (i=0)THEN
																	IF j>9 THEN
																			write(' ',j)
																		ELSE
																			write('  ',j)
																ELSE
																	IF (j=0) THEN
																		IF i>9 THEN
																			write(' ',i,' ')
																		ELSE
																			write('  ',i,' ')
																	ELSE
																		IF (stockcoord.x=j) AND (stockcoord.y=i) THEN//Ecrire aux coordonnées du tir du joueur sur la grille un caractère spécifique pour signaler l'emplacement de son tir
																			write(' ',CHR(64),' ')
																		ELSE 
																			write(' . ')//Sinon afficher des points
															END;
														writeln;
													END;
												writeln('Votre adversaire possède encore ',flotte2.restants,' bateau(x). Entrez pour continuer');
												readln;		
													
										END;

VAR
	flotte1,flotte2:flotte;
	i,j:INTEGER;
	Confirm:STRING;
BEGIN
	clrscr;
	writeln('Bienvenue dans le programme de bataille navale');
	writeln('Pour que vous compreniez le système voici comment est représentée la grille:');
	NettoyageFlotte(flotte1);																	//Initialisation de la flotte1
	AffichageTableau(flotte1);																	//Affichage exemple	
	writeln;
	writeln('Entrez pour commencer la partie');
	readln;
	clrscr;
	REPEAT													//Répéter l'initialisation de la flotte du joueur 1 jusqu'à ce qu'il confirme
		writeln;
		writeln('Joueur 1:');
		flotte1:=InitFlotte;
		flotte1.joueur:=1;			//Joueur 1
		flotte1.restants:=5;
		writeln('Entrez "OK" pour confirmer');
		readln(Confirm);
	UNTIL (Confirm='OK');
		clrscr;
	REPEAT 													//Répéter l'initialisation de la flotte du joueur 2 jusqu'à ce qu'il confirme
		writeln;
		writeln('Joueur 2:');
		flotte2:=InitFlotte;
		flotte2.joueur:=2;			//Joueur 2
		flotte2.restants:=5;
		writeln('Entrez "OK" pour confirmer');
		readln(Confirm);
	UNTIL (Confirm='OK');
		clrscr;
	REPEAT														//Répéter un tour de jeu jusqu'à ce qu'un des deux joueurs perde
		TourDeJeu(flotte1,flotte2);	
		clrscr;
			IF Defaite(flotte2)=FALSE THEN
				BEGIN
					TourDeJeu(flotte2,flotte1);
					clrscr;
				END;
	UNTIL Defaite(flotte1)=TRUE OR Defaite(flotte2)=TRUE;
	readln;
	
END.

{


	JEU D'ESSAI

		Affichage grille
		Entrée

	ENTREES
		x<-9
		y<- -1
	SORTIE
		"Erreur"
		
	ENTREES
		x<-9
		y<-50
	SORTIE
		"Erreur"
		
	ENTREES
		x<-14
		y<-2
		direction<-E
	SORTIE
		"Bateau hors limite, recommencez"
	ENTREES
		x<-12
		y<-2
		direction<-E
	SORTIE
		"Superposition impossible"
	
	....
	
	SORTIE
		"Entrez "OK" pour confirmer"
	ENTREES
		"Iceberg"
	---> Boucle relancée}