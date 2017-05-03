{Le jeu se joue seul,
joueur se caractérise par un numéro, situe sa position sur le jeu de l'oie
Si on arrive juste sur la case 66, le jeu est terminé, sinon on recule
Une oie toutes les 9 cases sauf en 63 double le déplacement (jet de dé doublé)
Une tete de mort à la case 58 renvoie en position de départ
Possibilité peut faire plusieurs parties, et quitter en cours de partie
Maximum de constantes, procédures. 
Compteur de nombre d'essais?

//ALGO: Jeu de l'oie
//BUT: Jeu de l'oie en programme jet de dé fait avancer le joueur, 66 cases en tout, toutes les 9 cases sauf 63 le jet est doublé, case 58 renvoie à la case départ.
Le joueur peut faire plusieurs parties et quitter celle en cours, nombre d'essais limités à X
//ENTREES: Requete de l'utilisateur: Lancer le dé ou quitter le programme
//SORTIES: Affichage étapes

CONS
	max:66
VAR
	player,essais,commande,jet:ENTIER
	
DEBUT
	ECRIRE"Bienvenue dans le jeu de l''oie"
	player<-1
		REPETER 
			ECRIRE"Veuillez entrer 1 pour lancer le dé"
			ECRIRE"Ou entrez 0 pour quitter"
			LIRE commande
				CAS commande PARMI
					0:ECRIRE"Bravo, vous avez abandonné"
					1:
						DEBUT
									jet<-Random(6)+1
									essais<-essais+1
										SI player+jet>max ALORS
											DEBUT
												jet<-player+jet
												player<-max-jet
											FIN
										SINON
											DEBUT
												player<-player+jet
												ECRIRE"Vous êtes à la case "& player
													CAS player PARMI
														9,18,27,36,45,54:
															DEBUT
																player<-player+jet
																ECRIRE"Il s'agit d'une case doublante donc vous arrivez à la case "& player
															FIN
														58:
															DEBUT
																player<-1
																ECRIRE"Il s'agit de la case tête de mort donc vous retournez à la case "& player
															FIN
														66:
															DEBUT
																ECRIRE"Vous avez gagné en "&essais&" essais, pour recommencer entrez 1"
																ECRIRE"Ou entrez 0 pour quitter"
																LIRE commande
															FIN
													FIN
														
											FIN
						FIN
				FIN
				PAR DEFAUT
					ECRIRE"Erreur de saisie"
						

		JUSQU'A essais=15 OU player=66 OU commande=0
FIN
}

PROGRAM JeuDeLoie;

USES CRT;

CONST
	max=66;
VAR
	essais, commande, jet, player:INTEGER;
	perdu:BOOLEAN;
	
BEGIN
	clrscr;
	writeln('Bienvenue dans le jeu de l''oie');
	player:=1;
		REPEAT 
			writeln(UTF8TOANSI('Entrez 1 pour lancer le dé, ou 0 pour quitter'));
			readln(commande);
				CASE commande OF
					0:
						BEGIN
							writeln(UTF8TOANSI('Bravo, vous avez abandonné'));
							readln;
						END;
					1:
						BEGIN
									writeln;
									writeln;
									jet:=(Random(6)+1);
									write((UTF8TOANSI('Le dé affiche ')),jet);
									essais:=(essais+1);
									perdu:=(essais>20);
										CASE perdu OF
											TRUE:
												BEGIN
													writeln(' ,vous avez perdu, pour recommencer tapez 1, pour quitter tapez 0');
													essais:=0;
													player:=1;
													readln(commande);
												END;
											FALSE:
												BEGIN
													IF(player+jet>max) THEN
														BEGIN
															write(UTF8TOANSI(' ,vous dépassez la dernière case de '));
															jet:=(player+jet);
															jet:=(jet-max);
															write(jet, (UTF8TOANSI(' donc vous reculez à la case ')));
															player:=(max-jet);
															writeln(player);
														END
													ELSE
														BEGIN
															player:=(player+jet);
															writeln(' ,vous arrivez sur la case ', player);
																CASE player OF
																	9,18,27,36,45,54:
																		BEGIN
																			player:=(player+jet);
																			writeln((UTF8TOANSI('Il s''agit d''une case doublante donc vous arrivez à la case ')), player);
																		END;
																END;
																CASE player OF
																	58:
																		BEGIN
																			player:=1;
																			writeln((UTF8TOANSI('Il s''agit de la case tête de mort donc vous retournez à la case ')), player);
																		END;
																END;
																CASE player OF
																	66:
																		BEGIN
																			writeln((UTF8TOANSI(' Vous avez gagné en ')),essais,' essais, pour recommencer entrez 1');
																			writeln('Ou entrez 0 pour quitter');
																			essais:=0;
																			player:=1;
																			readln(commande);
																		END;
																END;
																	
														END;
													CASE essais OF
														5:writeln('Il vous reste 15 essais');
														10:writeln('Il vous reste 10 essais');
														15:writeln('Il vous reste 5 essais !');
														19:writeln('Il vous reste 2 essais !!');
														20:writeln('C''est votre dernier essai');
													END;
												END;
										END;
						END;
				END;
				IF (commande<>0) AND (commande<>1) THEN
					BEGIN
						writeln(' Erreur de saisie');
						readln;
					END;
		UNTIL commande=0;
END.