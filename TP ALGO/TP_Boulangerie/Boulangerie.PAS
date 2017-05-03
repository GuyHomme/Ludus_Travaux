{
Boulangerie ouverte de 7h à 13h et de 16h à 20h
SAUF lundi après-midi et le mardi toute la journée
On suppose que H est un entier de 0 à 23
Le jour j code 0 pour lundi, 1 pour mardi, etc...




//BUT: Ecrire un programme pour savoir si la boulangerie est ouverte en fonction de l'heure, et le jour
//ENTREES: Heure, jour
//SORTIES: Affichage ouverture ou pas

TYPE
	jours=(lundi,mardi,mercredi,jeudi,vendredi,samedi,dimanche)
	
TYPE
	H=0..23
	
	
FONCTION horaires(j:ENTIER):BOOLEEN

DEBUT
horaires<-(j=1)
FIN

FONCTION lundi(heure:H):BOOLEEN
DEBUT
lundi<-(heure>=16)
FIN

PROCEDURE Affichage (jour:ENTIER ; heure:H ; état:BOOLEEN)
VAR
	string:CHAINE
DEBUT
	CAS état PARMI
		VRAI:string<-"fermée"
		FAUX:string<-"ouverte"
	FIN CASPARMI
	ECRIRE("La boulangerie sera " & string &" le " & jour & " à " & heure)
FIN
	
VAR
	jour:CHAINE
	intjour:ENTIER
	semaine:jours
	heure:H
	
DEBUT
	ECRIRE("Programme horaires de boulangerie")
	ECRIRE("Saisissez le jour de votre choix")
		REPETER
			ECRIRE("De lundi à dimanche")
			LIRE(jour)
			intjour<-ord(jour)
		JUSQU'A (intjour>=0) ET (intjour<=6)
	SI horaires(intjour) ALORS
		ECRIRE("Quelle horaire ?")
		ECRIRE("De 0 à 23 h (Ecrivez seulement l'heure)")
		LIRE(H)
		
	SINON 
		Affichage()
		
				
		
FIN


}


TYPE
	jours=(lundi,mardi,mercredi,jeudi,vendredi,samedi,dimanche);
	
TYPE
	H=0..23;
	
FUNCTION Tmardi(j:integer):BOOLEAN;
BEGIN
mardi:=(j=1);
END;

FUNCTION Tlundi(heure:H): BOOLEAN;
BEGIN
lundi:=(heure>=16);
END;

PROCEDURE Affichage(jour:chaine ; heure:H ; état:BOOLEAN);
VAR
	chaine:STRING;
BEGIN
	CASE état OF 
		TRUE:chaine:=('fermée');
		FALSE:chaine:=('ouverte');
	END;
		writeln('La boulangerie sera '+chaine+' le '+jour+' à '+heure);
END;


VAR
	jour:STRING;
	intjour:ENTIER;
	heure:H;
	
BEGIN
	writeln('Programme d''ouverture de boulangerie');
	writeln('Saisissez le jour de votre choix');
		REPEAT
			writeln('De lundi à dimanche');
			readln(jour);
			intjour:=ord(jour);
		UNTIL (intjour>=0) AND (intjour<=6);
	IF (Tmardi(intjour)<>TRUE) THEN
		BEGIN
			writeln('Quelle horaire ?');
			writeln('De 0 à 23h (Ecrivez seulement l''heure)');
			readln(heure);
			Affichage(jour,heure,Tlundi(heure);
		END;
	ELSE
		Affichage(jour,heure,Tmardi(intjour));
END;










