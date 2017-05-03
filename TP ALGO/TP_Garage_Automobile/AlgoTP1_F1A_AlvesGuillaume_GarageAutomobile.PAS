{
ALGO: GarageAutomobile
//BUT: Créer un algorithme qui gère 2 garages (adresse,nom,capacité maximum de 15 hangar) possédant des hangar (marque,modèle,énergie,puissance finale,puissance DYN,couleur,options,année du modèle, prix du modèle,etc...)  
//ENTREES:Caractéristiques de chaque garage et voiture
//SORTIES:Affichage fonctionnalité demandée


//traiter le "." après l'"@" dans la verif d'adresse mail
	
// 	Traitement partiellement entamé


CONST
	CapaciteMax=15				//Capacité maximale de stock d'un garage
	MaxFiscal=51				//Valeur maximale de la puissance fiscale
	MaxGarage=10				//Nombre maximal de garages
	Aujourdhui=2017				//Année actuelle
	PrixMini=5000				//Prix minimal d'une voiture

TYPE
		liste:tableau[1..MaxGarage] DE garage 
		stockage:tableau[1..CapaciteMax] DE voiture
	
TYPE LOGO=(Mercedes,Toyota,Renault,Peugeot,BMW)

TYPE ENERGIE=(Essence,Diesel,GPL,Electrique,Hybride)

TYPE COULEUR=(Rouge,Noir,Blanc,Bleu,Jaune)

TYPE
	ADRESSE=ENREGISTREMENT
		
		CP,email,voie,ville,pays,Tel,numero:CHAINE
FIN ENREGISTREMENT

TYPE
	Voiture=ENREGISTREMENT
		marque:logo
		carburant:energie
		Pfiscale,PDYN,prix,age,annee:ENTIER
		cotearg:REEL
		plaque,datecircu,modele,options:CHAINE
		color:COULEUR
FIN ENREGISTREMENT
	
TYPE
	GARAGE=ENREGISTREMENT
		nom:CHAINE
		emplac:adresse
		capacite:ENTIER
		hangar:stockage
FIN ENREGISTREMENT		

FONCTION ConvertDate (Date:CHAINE): ENTIER						

	//BUT: Transformer une date sous forme de chaîne en entier
	//ENTREES: Chaine au format JJ/MM/AAAA
	//SORTIES:	ConvertDate de type ENTIER interprétant les caractères AAAA comme des entiers
	
		VAR
			test3:CHAINE				
			stock,i:ENTIER
				DEBUT
					test3<-EXTRACTION(Date,7,4)		//Extraction des 4 derniers caractères de la date (AAAA)
						POUR i DE 1 A 4 FAIRE		//Pour chacun de ces caractères
							CAS test3[i] PARMI		//Stockage du chiffre en fonction du caractère dans la variable stock
								"1":stock<-1
								"2":stock<-2
								"3":stock<-3
								"4":stock<-4
								"5":stock<-5
								"6":stock<-6
								"7":stock<-7
								"8":stock<-8
								"9":stock<-9
							FIN CAS PARMI
							ConvertDate<-ConvertDate*10+stock	//Attribution des entiers récupérés dans stock dans ConvertDate. Multiplication par 10 pour rajouter les dizaines, centaines, etc..
						FIN POUR
				FIN

FONCTION PlaqueIm : CHAINE								

	//BUT: Génération d'une plaque d'immatriculation au format: XXX-XX-XX où les deux derniers caractères sont des entiers
	//ENTREES: Aucune
	//SORTIES: PlaqueIm de type chaîne
	
		VAR
			i:ENTIER				// i pour boucle incrémentielle
				DEBUT
					POUR i de 1 A 9 FAIRE		//Pour les 9 caractères composant une plaque d'immatriculation (en comptant les tirets)
						CAS i PARMI		
							4,7: PlaqueIm<-"-"								// Placement des tirets aux emplacements 4 et 7 de la chaîne
							8,9: PlaqueIm[i]<-(CHR(ALEATOIRE(8)+48))		// Incrémentation pour éviter la valeur 0. +47 pour atteindre la catégorie "Entier" des caractères
						CAS PAR DEFAUT
							PlaqueIm[i]<-(CHR(ALEATOIRE(24)+41))			//Autrement, on désire obtenir des caractères
						FIN CAS PARMI
					FIN POUR
				FIN
			
FONCTION CoteArgus(prix,age:ENTIER): ENTIER

	//BUT: Calculer grossièrement la côte argus d'une voiture en fonction de son prix et de son âge
	//ENTREES:	Prix et âge de type ENTIER
	//SORTIES: CoteArgus de type ENTIER
	
				DEBUT
						CAS age PARMI								//Cas parmi pour les 3 premières années d'une voiture, et au-delà de 3 par-défaut
							0:CoteArgus<-prix						//En-dessous de la première année : Le prix ne change pas
							1:CoteArgus<-prix*0.75					//A partir de la 1ère année : Le prix précédent baisse de 25%
							2:CoteArgus<-(prix*0.75)*0.90			//A partir de la 2ème année : Le prix précédent baisse de 10%
							3:CoteArgus<-(((prix*0.75)*0.90)*0.90)	//A partir de la 3ème année : Le prix précédent baisse de 10%  
						CAS PAR DEFAUT
							CoteArgus<-(((prix*0.75)*0.90)*0.90)	// et reste le même peu importe le nombre d'années
						FIN CAS PARMI
				FIN
			

FONCTION VerifDate (var Date:CHAINE) : BOOLEEN					

	//BUT: Vérifier si la chaîne entrée est une date au format JJ/MM/AAAA
	//ENTREES: Chaine
	//SORTIES: Booléen 
	
			VAR
				test,test1,test2:CHAINE							// une chaine pour chaque valeur de la date (test:JJ, test1:MM, test2:AAAA)
				longueur:ENTIER									
					DEBUT
						VerifDate<-FAUX							//Initialisations
						dateint<-0
						longueur<-(longueur(Date))
							CAS longueur PARMI
								8:
									DEBUT
										test<-EXTRACTION(Date,1,2)
										test1<-EXTRACTION(Date,3,2)
										test3<-EXTRACTION(Date,4,4)
											SI VerifEntier(test) ET VerifEntier(test2) ET VerifEntier(test3) ALORS				//Si chacune de ces sous-chaînes est composée exclusivement d'entiers
												VerifDate<-VRAI																	//La fonction retourne VRAI
												Date<-EXTRACTION(Date,1,2) & "/" & EXTRACTION(Date,3,2) & "/" & EXTRACTION(Date,4,4)	//Rajout des caractères "/" si l'utilisateur ne les a pas rentré
											SINON
												ECRIRE("Composition de la chaîne incorrecte")							//Sinon, message d'erreur et VerifDate retourne FAUX
												VerifDate<-FAUX
											FIN SI
									FIN
								10:													//Si la chaine comprend bien 10 caractères (JJ/MM/AAAA)
									DEBUT
										test<-EXTRACTION(Date,1,2)						//Extractions consécutives des sous-chaînes aux emplacements supposés des valeurs chiffrées
										test1<-EXTRACTION(Date,4,2)
										test3<-EXTRACTION(Date,7,4)
											SI VerifEntier(test) ET VerifEntier(test2) ET VerifEntier(test3) ALORS		//Si chacune de ces sous-chaînes est composée exclusivement d'entiers
												VerifDate<-VRAI															//La fonction retourne VRAI
											SINON
												ECRIRE("Composition de la chaîne incorrecte")							//Sinon, message d'erreur et VerifDate retourne FAUX
												VerifDate<-FAUX
											FIN SI
									FIN
							CAS PAR DEFAUT
								ECRIRE("Longueur de la date incorrecte")	//Sinon message d'erreur et VerifDate retourne FAUX
								VerifDate<-FAUX
							FIN CAS PARMI
							
							
			FIN
			
FONCTION VerifEntier (mot:CHAINE) DE BOOLEEN				

	//BUT: Vérifier si la chaine entrée est uniquement composée de valeur numériques
	//ENTREES: Chaine de caractères
	//SORTIES: Booléen vérifiant si chaque caractère est un entier
	
			VAR
				longueur,stockverif,i:ENTIER			// i pour boucle incrémentielle, stockverif qui compte les erreurs
					DEBUT
						VerifEntier<-FAUX									//Initialisations
						stockverif<-0
						longueur<-(longueur(mot))
							POUR i DE 1 A longueur FAIRE						//Pour chaque caractère de la chaîne
								SI mot[i]<CHR(48) OU mot[i]>CHR(71) ALORS		//S'il s'agit d'un caractère différent d'un entier (par rapport à la table ascii)
									stockverif<-stockverif+1					//Incrémentation du stockverif
								FIN SI
							FIN POUR
								SI stockverif=0 ALORS							//Si stockverif n'a pas été incrémenté, alors la fonction retourne VRAI
									VerifEntier<-VRAI
								SINON											//Sinon, la fonction retourne FAUX
									VerifEntier<-FAUX
								FIN SI
					FIN

PROCEDURE AfficheGaragesDispo(tabdonnee:liste)
	
	//BUT: Afficher les garages qui peuvent encore stocker au moins une voiture en plus
	//ENTREES: Liste de chaque garage et leurs caractéristiques, comprenant la capacité restante (tabdonnee)
	//SORTIES: Affichage garage(s) disponible(s)
	
			VAR
				i:ENTIER				// i pour boucle incrémentielle
					DEBUT
						POUR i DE 1 A stockgarage FAIRE									//Pour chaque cellule occupée du tableau contenant les garages
							SI tabdonnee[i].capacite>0 ALORS							//Si la capacité est supérieure à 0
								ECRIRE("Garage N°" & i & " "" " & tabdonnee[i].nom & " "" avec " & tabdonnee[i].capacite & " emplacement(s) disponible(s)")		//Enumération du garage i
							FIN SI
						FIN POUR
					FIN
			
PROCEDURE AffichageGarages(stockgarage:ENTIER ; tabdonnee:liste)

	//BUT: Afficher tous les garages et leurs caractéristiques (Voitures exclues)
	//ENTREES: Nombre de garages actuel (stockgarage), liste de chaque garage et leurs caractéristiques (tabdonnee)
	//SORTIES: Affichage garages et leurs caractéristiques 

			VAR
				i:ENTIER				// i pour boucle incrémentielle
					DEBUT
						POUR i DE 1 A stockgarage FAIRE
							ECRIRE("  Garage N°" & i )
							ECRIRE("  Nom : " & tabdonnee[i].nom )
							ECRIRE("  Adresse : " & tabdonnee[i].emplac.numero & " " & tabonnee[i].emplac.voie & " " & tabdonnee[i].emplac.ville & " " & tabdonnee[i].emplac.CP & " " & tabdonnee[i].emplac.pays)
							ECRIRE("  Email : " & tabdonnee[i].emplac.email )
							ECRIRE("  Numéro de téléphone : " & tabdonnee[i].emplac.Tel )
							ECRIRE("  Capacité de stockage actuelle : " & tabdonnee[i].capacite)
						FIN POUR
					FIN
				
PROCEDURE AffichageVoitures (garagen:garage)

	//BUT: Afficher toutes les voitures et leurs caractéristiques d'un garage donné
	//ENTREES: Garage
	//SORTIES: Affichage voitures et leurs caractéristiques
	
			VAR
				i:ENTIER				// i pour boucle incrémentielle
					DEBUT
						POUR i DE 1 A (CapaciteMax-garagen.capacite) FAIRE		// Pour le nombre de voitures stockées du garage entré
							ECRIRE("Voiture N°" & i)
							ECRIRE("Modèle : " & garagen.hangar[i].modele)
							ECRIRE("Marque : " & garagen.hangar[i].marque)
							ECRIRE("Couleur : " & garagen.hangar[i].color)
							ECRIRE("Carburant : " & garagen.hangar[i].carburant)
							ECRIRE("Puissance : " & garagen.hangar[i].PDYN)
							ECRIRE("Puissance fiscale : " & garagen.hangar[i].Pfiscale)
							ECRIRE("Année de fabrication : " & garagen.hangar[i].annee)
							ECRIRE("Année de mise en circulation : " & garagen.hangar[i].datecircu)
							ECRIRE("Âge : " & garagen.hangar[i].age)
							ECRIRE("Prix : " & garagen.hangar[i].prix)
						FIN POUR
					FIN
			
PROCEDURE StockageVoiture (stockgarage:ENTIER ; var tabdonnee:liste ; engin:voiture)

	//BUT: Stocker une voiture au bon emplacement du garage sélectionné
	//ENTREES: stockgarage: le nombre de garages actuel, tabdonnee: la liste de chaque garage, engin: la voiture crééée
	//SORTIES: Décrémentation de la capacité de stock du garage, et attribution de la voiture dans la bonne cellule du hangar

			VAR
				nbgarage:ENTIER
					DEBUT
						ECRIRE("Entrez le numéro du garage dans lequel vous voulez stocker votre voiture")
						ECRIRE("Garage(s) disponible(s) :")
						AfficheGaragesDispo(tabdonnee)
						REPETER
							REPETER
								LIRE(nbgarage)
							JUSQU'A (nbgarage>=1) ET (nbgarage<=stockgarage)
								SI (stockdonnee[nbgarage].capacite>0) ALORS			//Deux boucles pour afficher le message d'erreur, autrement la vérification pourrait induire une cellule qui n'existe pas dans le tableau
									ECRIRE("Ce garage n'est pas disponbile")
								FIN SI
						JUSQU'A (tabdonnee[nbgarage].capacite>0)
						tabdonnee[nbgarage].hangar[(CapaciteMax+1)-tabdonnee[nbgarage].capacite]<-engin 		//Attribution au garage sélectionné de la voiture crééée à l'emplacement (hangar) défini en fonction de la capacité restante. 
																												//Si CapacitéMax=15, alors le véhicule sera attribué au hangar 16 - [Capacité du garage], pour un ordre croissant
						ECRIRE("La voiture " & engin.modele & " a bien été stocké dans le hangar " & tabdonnee[nbgarage].capacite & " du garage " & nbgarage )
						tabdonnee[nbgarage].capacite<-(tabdonnee[nbgarage].capacite-1)							//Décrémentation de la capacité du garage
					FIN
			
FONCTION VerifOptRempli(options:CHAINE) : BOOLEEN

	//BUT: Définir si une chaine de caractères est bien écrite au format "#options#options" 
	//ENTREES: Chaine de caractères déterminant les options
	//SORTIES: Booléen qui valide ou non le but

	VAR
		longueur,i:ENTIER
			DEBUT
				VerifOptRempli<-FAUX									//Initialisation
				longueur<-longueur(options)
					SI longueur<2 ALORS
						ECRIRE("Erreur de saisie dans la chaîne")
					SINON
						POUR i DE 1 A longueur FAIRE
							SI options[i]="#" ALORS						//Vérification de la présence du caractère "#" dans la chaîne
								VerifOptRempli<-VRAI
							FIN SI
						FIN POUR
			FIN
		
		
FONCTION CreaVoiture (tabdonnee:liste)DE Voiture						//Création de voiture, avec vérification par boucle de chaque paramètre après l'entrée de l'utilisateur
	VAR
		longueur,entree:ENTIER
		string:CHAINE
			DEBUT
				entree<-1
				LIRE("CreaVoiture.possesseur")
				ECRIRE("Entrez la marque de la voiture")				//Lecture marque de la fonction voiture
				REPETER
					ECRIRE(1=Mercedes,2=Toyota,3=Renault,4=Peugeot,5=BMW )
					LIRE(entree)
				JUSQU'A (entree>=1) ET (entree<=5)						//Jusqu'à ce que l'entrée soit valide (5 possibilités)
					CAS entree PARMI
						1:CreaVoiture.marque<-Mercedes					//Cas parmi pour le type énuméré
						2:CreaVoiture.marque<-Toyota
						3:CreaVoiture.marque<-Renault
						4:CreaVoiture.marque<-Peugeot
						5:CreaVoiture.marque<-BMW
					FIN CAS PARMI
				entree<-1												//Réinitialisation de la variable entree
				ECRIRE("Entrez le modèle de la voiture")
				LIRE(CreaVoiture.modele)								//On laisse le choix à l'utilisateur d'entrer le nom du modèle
				ECRIRE("Entres les options de la voiture")
					REPETER
						ECRIRE("0=Aucune option. Autrement énumérez pour chaque option un #")
						LIRE(CreaVoiture.options)
					JUSQU'A CreaVoiture.options="0" OU VerifOptRempli(CreaVoiture.options)
				ECRIRE("Entrez le type d'énergie que la voiture requiert : ")
				REPETER
					ECRIRE("1=Essence,2=Diesel,3=GPL,4=Electrique,5=Hybride")
					LIRE(entree)
				JUSQU'A (entree>=1) ET (entree<=5)						//Jusqu'à ce que l'entrée soit valide (5 possibilités)
					CAS entree PARMI
						1:CreaVoiture.carburant<-Essence				//Cas parmi pour le type énuméré
						2:CreaVoiture.carburant<-Diesel
						3:CreaVoiture.carburant<-GPL
						4:CreaVoiture.carburant<-Electrique
						5:CreaVoiture.carburant<-Hybride
					FIN CAS PARMI
				entree<-1												//Réinitialisation de la variable entree
				ECRIRE("Entrez la puissance de la voiture ( en CV )")
				LIRE(CreaVoiture.PDYN)
				ECRIRE("Entrez la puissance fiscale de la voiture")
					REPETER
						ECRIRE(" jusqu'à " & MaxFiscal)
						LIRE(CreaVoiture.Pfiscale)
					JUSQU'A (CreaVoiture.Pfiscale>=1) ET (CreaVoiture.Pfiscale<=MaxFiscal) ET (CreaVoiture.Pfiscale<CreaVoiture.PDYN)	//La puissance fiscale est forcément inférieure à la puissance du véhicule et à 51 (constante)
				ECRIRE("Entrez la couleur de la voiture :")
				REPETER
					ECRIRE("1=Rouge,2=Noir,3=Blanc,4=Bleu,5=Jaune")
					LIRE(entree)
				JUSQU'A (entree>=1) ET (entree<=5)						//Jusqu'à ce que l'entrée soit valide (5 possibilités)
					CAS entree PARMI
							1:CreaVoiture.color<-Rouge					//Cas parmi pour le type énuméré
							2:CreaVoiture.color<-Noir
							3:CreaVoiture.color<-Blanc
							4:CreaVoiture.color<-Bleu
							5:CreaVoiture.color<-Jaune
						FIN CAS PARMI
				ECRIRE("Entrez l'année de fabrication de la voiture")
					REPETER
						ECRIRE(" au format AAAA")
						LIRE(CreaVoiture.annee)
					JUSQU'A (CreaVoiture.annee<=Aujourdhui)				//Jusqu'à ce que l'année entrée soit inférieure ou égale à la constante "Aujourdhui"
				ECRIRE("Entrez la date de mise en circulation de la voiture")
					REPETER
						ECRIRE(" au format JJ/MM/AAAA")
						LIRE(CreaVoiture.datecircu)
					JUSQU'A VerifDate(CreaVoiture.datecircu)=VRAI ET (ConvertDate(CreaVoiture.datecircu)<=CreaVoiture.annee)	//Jusqu'à ce que l'entrée soit bien au format JJ/MM/AAAA et la date obtenue soit inférieure ou égale à la date de fabrication
				ECRIRE("Entrez le prix de la voiture en €")
					REPETER
						LIRE(CreaVoiture.prix)
					JUSQU'A (CreaVoiture.prix>=PrixMini)				//Jusqu'à ce que le prix soit supérieur ou égal au prix minimum (constante)
				CreaVoiture.age<-CreaVoiture.annee-ConvertDate(CreaVoiture.datecircu)		//Calcul de l'âge
				CreaVoiture.cotearg<-CoteArgus(CreaVoiture.prix,CreaVoiture.age)			//Calcul de la côte Argus
				CreaVoiture.plaque<-PlaqueIm												//Attribution de la plaque d'immatriculation
				
			FIN
			
FONCTION VerifEmail (mail:CHAINE) DE BOOLEEN

	//BUT:Vérifier si une chaine de caractères contient les caractéristiques d'une adresse mail
	//ENTREES:Chaine
	//SORTIES: Booléen indiquant si les deux caractères "@" et "." sont présents dans la chaine
	
			VAR
				longueur:ENTIER
				verif1,verif2:BOOLEEN			//Deux conditions 
					DEBUT
						VerifEmail<-FAUX								//initialisations
						verif1<-FAUX
						verif2<-FAUX
						longueur<-(longueur(mail))
						POUR i DE 1 A longueur FAIRE	//Pour l'intégralité des caractères de la chaine
							CAS mail[i] PARMI			//Vérification du caractère "@" et du caractère "."
								"@": verif1<-VRAI
								".": verif2<-VRAI
							FIN CAS PARMI
						FIN POUR
							SI verif1=VRAI ET verif2=VRAI ALORS		// Si les deux conditions sont vérifiées, la fonction retourne VRAI
								VerifEmail<-VRAI
							FIN SI
					FIN
			
FONCTION VerifAdresse (emplac:adresse) DE BOOLEEN

	//BUT:Vérifier si une adresse est correcte et préciser quels champs sont incorrects dans la saisie
	//ENTREES: Adresse de type adresse (attributs: CP,email,voie,ville,pays,Tel,numero:CHAINE)
	//SORTIES:Booléen indiquant si chaque critère est correct
	
			VAR
				longueur,i:ENTIER								//i pour les boucles incrémentielles
				verif1,verif2,verif3:BOOLEEN
					DEBUT
						VerifAdresse<-FAUX										//initialisation
						longueur<-(longueur(emplac.CP))
							SI longueur<>5 OU VerifEntier(emplac.CP)=FAUX ALORS			//Si la longueur du code postal est différente de 5 ou que la chaîne contient d'autres caractères que des entiers, alors verif1 retourne FAUX
								verif1<-FAUX	
								ECRIRE("Code postal incorrect")					//+ message d'erreur
							SINON												//Sinon, cette condition est vérifiée et verif1 retourne VRAI
								verif1<-VRAI
							FIN SI
							SI VerifEmail(mail)=FAUX ALORS						//Si la chaine email est incorrecte, alors verif2 retourne FAUX
								verif2<-FAUX
								ECRIRE("Adresse Email incorrecte")				//+ message d'erreur
							SINON												//Sinon, cette condition est vérifiée et verif2 retourne VRAI 
								verif2<-VRAI
							FIN SI
						longueur<-(longueur(emplac.Tel)							//Longueur de la taille du numéro de téléphone
							SI longueur<>10 OU VerifEntier(emplac.Tel) ALORS	//Si le numéro de téléphone est trop long ou que la chaîne contient d'autres caractères que des entiers, alors verif3 retourne FAUX
								verif3<-FAUX
								ECRIRE("Numéro de téléphone incorrect")			//+ message d'erreur
							SINON										//Sinon, cette condition est vérifiée et verif3 retourne VRAI
								verif3<-VRAI
							FIN SI
						SI verif1=VRAI ET verif2=VRAI ET verif3=VRAI ALORS	//Si chaque vérification retourne VRAI alors, la fonction retourne VRAI				
							VerifAdresse<-VRAI
						SINON											//Sinon la fonction retourne FAUX + message d'erreur
							ECRIRE("Adresse non valide, recommencez")
					FIN

PROCEDURE AffichageAncienV(stockgarage:ENTIER ; tabdonnee:liste)

			DEBUT
				
			FIN
					
FONCTION CreaGarage DE Garage

	//BUT: Créer un garage en demandant l'entrée de chaque atribut de la fonction de type garage, qui seront vérifiés
	//ENTREES: Saisie de l'utilisateur
	//SORTIES:	Fonction de type Garage
	
				DEBUT
					ECRIRE("Entrez le nom du garage")
					LIRE("CreaGarage.nom")
					REPETER													//Répéter la lecture des variables
						ECRIRE("Adresse, ")
						ECRIRE("Entrez le numéro de la rue")
						LIRE(emplac.numero)
						ECRIRE("Entrez la rue (exemple: rue des arbres)")
						LIRE(emplac.voie)
						ECRIRE("Entrez le nom de la ville")
						LIRE(emplac.ville)
						ECRIRE("Entrez votre code postal")
						LIRE(emplac.CP)
						ECRIRE("Entrez le pays")
						LIRE(emplac.pays)
						ECRIRE("Entrez le numéro de téléphone")
						LIRE(emplac.Tel)
						ECRIRE("Entrez votre adresse mail")
						LIRE(emplac.email)
					JUSQU'A VerifAdresse(emplac)=VRAI 						//Jusqu'à ce que l'adresse entrée soit valable
					CreaGarage.capacite<-CapaciteMax						//Par défaut chaque garage peut posséder jusqu'à CapacitéMax voitures
				FIN


PROCEDURE NavigGarages(stockgarage,commande2:ENTIER ; tabdonnee:liste)
		
		DEBUT
			AffichageGarages(stockgarage,tabdonnee)
									ECRIRE("Voulez-vous visiter un de ces garages ?")
									REPETER
										ECRIRE(" 1=NON ")
										ECRIRE(" 2=OUI ")
										LIRE(commande2)
									JUSQU'A (commande2=1) OU (commande2=2)
										CAS commande2 PARMI
											1:
												DEBUT
													ECRIRE("Retour au menu principal")
												FIN
											2:
												DEBUT
													commande2<-1
													ECRIRE("Entrez le numéro du garage que vous voulez visiter (Par défaut le garage 1)")
													REPETER
														ECRIRE("Garages disponibles : ")
															POUR i DE 1 A stockgarage FAIRE
																ECRIRE(i)
															FIN POUR
														LIRE(commande2)
													JUSQU'A (commande2>=1) ET (commande2<=stockgarage)
													AffichageVoitures(tabdonnee[commande2])
												FIN
		FIN
		
		
FONCTION Garage+ (stockgarage:ENTIER ; stockdonnee:liste) : ENTIER

				DEBUT
					Garage+<-0										//Initialisation
					POUR i DE 1 A stockgarage FAIRE
						SI (CapaciteMax-stockdonnee[i].capacite)>Garage+ ALORS		//Tests consécutifs d'une valeur supérieure à la valeur actuelle pour trouver la valeur maximale
							Garage+<-i
						FIN SI
					FIN POUR
						SI Garage+=0 ALORS						//Si la fonction n'a pas été incrémentée, alors tous les garages sont pleins
							Garage+
						FIN SI
				FIN
		
		
VAR
	commande,commande2,commande3,commande4,stockgarage,i:ENTIER
	tabdonnee:liste
DEBUT
	ECRIRE("Programme de stockage de hangar et de garages")
	stockgarage<-0															//Initialisation
	commande<-25
		REPETER
			TANT QUE (stockgarage<MaxGarage) FAIRE							//Tant que le nombre maximal de garage n'est pas atteint, l'option "Créer un garage" reste disponible
				ECRIRE("Il y a actuellement " & stockgarage & " garage(s)")
				ECRIRE("Entrez : ")
				ECRIRE(" 0 pour quitter")
				ECRIRE(" 1 pour créer un garage")
				ECRIRE(" 2 pour créer une voiture")
				ECRIRE(" 3 pour voir les garages actuels")
				ECRIRE(" 4 pour accéder aux fonctionnalités inutiles")
				LIRE(commande)
					SI (commande=2) OU (commande=3) OU (commande=4) ET (stockgarage=0) ALORS
						ECRIRE("Veuillez d'abord créer un garage")
					SINON
						CAS commande PARMI
							1:
								DEBUT
									stockgarage<-(stockgarage+1)
									(tabdonnee[stockgarage])<-CreaGarage
									ECRIRE("Le garage "& tabdonnee[stockgarage].nom & " a été créée")
								FIN
							2:
								DEBUT
									StockageVoiture(stockgarage,tabdonnee,CreaVoiture)
								FIN
							3:
								DEBUT
									NavigGarages(stockgarage,commande2,tabdonnee)
								FIN
							4:
								DEBUT
									REPETER
										ECRIRE(" 1 pour afficher le garage possédant le plus de véhicules")
										ECRIRE(" 2 pour afficher le véhicule le plus ancien")
										ECRIRE(" 3 pour afficher la moyenne des valeurs des véhicules")
										ECRIRE(" 4 pour afficher le véhicule le plus cher en à valeur à neuf")
										ECRIRE(" 5 pour rechercher des véhicules en fonction de leurs paramètres")
										LIRE(commande2)
											CAS commande2 PARMI
												1:
													DEBUT
														SI Garage+(stockgarage,stockdonnee)>0 ALORS
															ECRIRE(" Le garage possédant le plus de véhicules est le garage " & Garage+(stockgarage,stockdonnee) & " avec " & CapaciteMax-(tabdonnee[Garage+(stockgarage,stockdonnee)].capacite) )
														SINON
															ECRIRE("Tous les garages sont pleins")
														FIN SI
													FIN
												2:
													DEBUT
														commande3<-0
														ECRIRE("Au sein d'un seul garage ou de chacun d'entre eux ?")
														REPETER
															ECRIRE("1=Un seul garage")
															ECRIRE("2=Tous les garages")
															LIRE(commande3)
														JUSQU'A (commande3=1) OU (commande3=2)
															CAS commande3 PARMI
																1:
																	DEBUT
																		ECRIRE("Quel garage ?")
																			REPETER
																				ECRIRE("Jusqu'à " & stockgarage)
																				LIRE(commande4)
																			JUSQU'A (commande4>=1) ET (commande4<=stockgarage)
																			
																	FIN
													FIN
											FIN CAS PARMI
									JUSQU'A  
								FIN
						PAR DEFAUT
							ECRIRE("Mais que faites-vous ?")
						FIN CAS PARMI
			FIN TANTQUE
			TANT QUE (stockgarage=MaxGarage) FAIRE
				ECRIRE("Le nombre maximal de garages " & stockgarage & " est atteint")
				ECRIRE("Entrez : ")
				ECRIRE(" 0 pour quitter")
				ECRIRE(" 1 pour créer une voiture")
				ECRIRE(" 2 pour voir les garages actuels")
				ECRIRE(" 3 pour accéder aux fonctionnalités inutiles")
				LIRE(commande)
					CAS commande PARMI
							1:
								DEBUT
									StockageVoiture(stockgarage,tabdonnee,CreaVoiture)
								FIN
							2:
								DEBUT
									NavigGarages(stockgarage,commande2,tabdonnee)
								FIN
					PAR DEFAUT
							ECRIRE("Mais que faites-vous ?")
					FIN CAS PARMI
			FIN TANTQUE
		JUSQU'A commande=0
FIN


}