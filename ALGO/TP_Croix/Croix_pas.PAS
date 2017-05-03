PROGRAM Croix;

uses crt;

VAR
	lettre:CHAR;
	taille,j,i:integer;

BEGIN
	clrscr;
	writeln('Entrez le caractere qui constituera la croix');
	readln(lettre);
	writeln('Entrez la taille de la croix');
	readln(taille);
		FOR i:=1 TO taille DO
			BEGIN
					FOR j:=1 TO taille DO
						BEGIN
								IF (i=j) OR (j=taille-j) THEN
									BEGIN
										write(lettre)
									END;
							write(' ');
						END;
			writeln;
			END;
	readln;
END.
				
