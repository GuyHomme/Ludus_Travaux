PROGRAM X2;

uses crt;

CONST
	espace1=' ';
VAR
	taille,long_esp,long_esp2,long_esp3:INTEGER;
	valide,pair,impair,invalide:BOOLEAN;
	lettre:CHAR;
	espace,espace2,espace3:STRING;

BEGIN
	clrscr;//Modif chibre
	espace:=' ';
	writeln('Veuillez entrer le caractere qui constituera votre croix');
	readln(lettre);
	writeln('Veuillez maintenant saisir l"entier qui definira la taille de votre croix');
	readln(taille);
	invalide:=(taille<=0);
	valide:=(taille>0);
	pair:=(taille MOD 2=0);
	impair:=(taille MOD 2>0);
		IF invalide THEN
			BEGIN
				writeln('Erreur mon ami');
			END;
						IF (valide) AND (impair) THEN
							BEGIN
								CASE (taille) OF
										1:writeln('Erreur');
										3:
											BEGIN
												writeln(lettre,espace1,lettre);
												writeln(espace1,lettre);
												writeln(lettre,espace1,lettre);
											END;
										5:
											BEGIN
												writeln(lettre,espace1,espace1,espace1,lettre);
												writeln(espace1,lettre,espace1,lettre);
												writeln(espace1,espace1,lettre);
												writeln(espace1,lettre,espace1,lettre);
												writeln(lettre,espace1,espace1,espace1,lettre);
											END;
								ELSE;
									taille:=(taille-2);
										REPEAT
												espace:=espace+espace1;
												long_esp:=length(espace);
										UNTIL (long_esp=taille);
											writeln(lettre,espace,lettre);
											espace3:=(espace);
											long_esp3:=length(espace3);
											espace2:=(' ');
											espace:=copy(espace,1,long_esp-2);
											long_esp:=length(espace);
											writeln(espace2,lettre,espace,lettre);
														REPEAT
															espace2:=espace2+espace1;
															espace:=copy(espace,1,long_esp-2);
															long_esp:=length(espace);
															writeln(espace2,lettre,espace,lettre);
														UNTIL (long_esp<=1);
															IF (long_esp<=1) THEN
																BEGIN
																	espace:=(' ');
																	long_esp:=length(espace);
																	espace2:=espace2+espace1;
																	writeln(espace2,lettre);
																	long_esp2:=length(espace2);
																	espace2:=copy(espace2,1,long_esp2-1);
																	long_esp2:=length(espace2);
																END;
															REPEAT
																writeln(espace2,lettre,espace,lettre);
																espace2:=copy(espace2,1,long_esp2-1);
																long_esp2:=length(espace2);
																espace:=espace+espace1+espace1;
																long_esp:=length(espace);
															UNTIL (long_esp=long_esp3+2);
								END;
							END
						ELSE
							BEGIN
								IF (valide) AND (pair) THEN
									BEGIN
											CASE (taille) OF
												2:writeln('Erreur');
												4:
													BEGIN
														writeln(lettre,espace1,espace1,lettre);
														writeln(espace1,lettre,lettre);
														writeln(espace1,lettre,lettre);
														writeln(lettre,espace1,espace1,lettre);
													END;
											ELSE;
												taille:=(taille-2);
													REPEAT 
														espace:=espace+espace1;
														long_esp:=length(espace);
													UNTIL (long_esp=taille);
														writeln(lettre,espace,lettre);
														espace3:=(espace);
														long_esp3:=length(espace3);
														espace2:=(' ');
														espace:=copy(espace,1,long_esp-2);
														long_esp:=length(espace);
														writeln(espace2,lettre,espace,lettre);
																	WHILE(long_esp>2)DO
																		BEGIN
																			espace2:=espace2+espace1;
																			espace:=copy(espace,1,long_esp-2);
																			long_esp:=length(espace);
																			writeln(espace2,lettre,espace,lettre);
																		END;
																			IF (long_esp<=2) THEN
																				BEGIN
																					espace:=('  ');
																					long_esp:=length(espace);
																					espace2:=espace2+espace1;
																					writeln(espace2,lettre,lettre);
																					writeln(espace2,lettre,lettre);
																					long_esp2:=length(espace2);
																					espace2:=copy(espace2,1,long_esp2-1);
																					long_esp2:=length(espace2);
																				END;
																			REPEAT
																				writeln(espace2,lettre,espace,lettre);
																				espace2:=copy(espace2,1,long_esp2-1);
																				long_esp2:=length(espace2);
																				espace:=espace+espace1+espace1;
																				long_esp:=length(espace);
																			UNTIL (long_esp=long_esp3+2);
										
											END;
									END;
							END;
	readln;
	END.