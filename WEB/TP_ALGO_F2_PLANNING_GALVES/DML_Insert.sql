/* Classes */

INSERT INTO CLASSE (NOM_CLA, NOM_NIV, NUM_CLA) values ("F21","F2","5");	
INSERT INTO CLASSE (NOM_CLA, NOM_NIV, NUM_CLA) values ("F22","F2","6");	
INSERT INTO CLASSE (NOM_CLA, NOM_NIV, NUM_CLA) values ("F11","F1","1");	
INSERT INTO CLASSE (NOM_CLA, NOM_NIV, NUM_CLA) values ("F12","F1","2");	
INSERT INTO CLASSE (NOM_CLA, NOM_NIV, NUM_CLA) values ("F13","F1","3");	
INSERT INTO CLASSE (NOM_CLA, NOM_NIV, NUM_CLA) values ("F14","F1","4");	
INSERT INTO CLASSE (NOM_CLA, NOM_NIV, NUM_CLA) values ("F31","F3","7");	
INSERT INTO CLASSE (NOM_CLA, NOM_NIV, NUM_CLA) values ("F32","F3","8");	
INSERT INTO CLASSE (NOM_CLA, NOM_NIV, NUM_CLA) values ("M1","M","9");	
INSERT INTO CLASSE (NOM_CLA, NOM_NIV, NUM_CLA) values ("M2","M","10");	

/* Matières */
	
INSERT INTO MATIERE (NOM_MAT) values ("C");	
INSERT INTO MATIERE (NOM_MAT) values ("GD");	
INSERT INTO MATIERE (NOM_MAT) values ("Anglais");	
INSERT INTO MATIERE (NOM_MAT) values ("Japonais");	
INSERT INTO MATIERE (NOM_MAT) values ("Web");	
INSERT INTO MATIERE (NOM_MAT) values ("BDD");	
INSERT INTO MATIERE (NOM_MAT) values ("Algo");	
INSERT INTO MATIERE (NOM_MAT) values ("IA");

/* Salles */	
	
INSERT INTO SALLE (NOM_SAL) values ("Kirby");	
INSERT INTO SALLE (NOM_SAL) values ("Croft");	
INSERT INTO SALLE (NOM_SAL) values ("Sonic");	
INSERT INTO SALLE (NOM_SAL) values ("Pokemon");	
INSERT INTO SALLE (NOM_SAL) values ("VR");	

/* Niveaux */

INSERT INTO NIVEAU (NOM_NIV) values ("F1");	
INSERT INTO NIVEAU (NOM_NIV) values ("F2");	
INSERT INTO NIVEAU (NOM_NIV) values ("F3");	
INSERT INTO NIVEAU (NOM_NIV) values ("M");

/* Enseignements */

INSERT INTO ENSEIGNEMENT (MAIL_ENS, NOM_MAT) values ("n.lehmann@ludus-academie.com","C");
INSERT INTO ENSEIGNEMENT (MAIL_ENS, NOM_MAT) values ("e.dentinger@ludus-academie.com","Anglais");
INSERT INTO ENSEIGNEMENT (MAIL_ENS, NOM_MAT) values ("g.madembo@ludus-academie.com","Web");
INSERT INTO ENSEIGNEMENT (MAIL_ENS, NOM_MAT) values ("e.dentinger@ludus-academie.com","Anglais");
INSERT INTO ENSEIGNEMENT (MAIL_ENS, NOM_MAT) values ("m.besmond@ludus-academie.com","Japonais");
INSERT INTO ENSEIGNEMENT (MAIL_ENS, NOM_MAT) values ("n.lehmann@ludus-academie.com","C");
INSERT INTO ENSEIGNEMENT (MAIL_ENS, NOM_MAT) values ("n.lehmann@ludus-academie.com","C");
INSERT INTO ENSEIGNEMENT (MAIL_ENS, NOM_MAT) values ("e.dentinger@ludus-academie.com","Anglais");
INSERT INTO ENSEIGNEMENT (MAIL_ENS, NOM_MAT) values ("c.muller@ludus-academie.com","Anglais");
INSERT INTO ENSEIGNEMENT (MAIL_ENS, NOM_MAT) values ("g.madembo@ludus-academie.com","Web");
INSERT INTO ENSEIGNEMENT (MAIL_ENS, NOM_MAT) values ("n.lehmann@ludus-academie.com","C");
INSERT INTO ENSEIGNEMENT (MAIL_ENS, NOM_MAT) values ("g.madembo@ludus-academie.com","Web");
INSERT INTO ENSEIGNEMENT (MAIL_ENS, NOM_MAT) values ("g.madembo@ludus-academie.com","Web");
INSERT INTO ENSEIGNEMENT (MAIL_ENS, NOM_MAT) values ("n.lehmann@ludus-academie.com","C");
INSERT INTO ENSEIGNEMENT (MAIL_ENS, NOM_MAT) values ("m.besmond@ludus-academie.com","Japonais");
INSERT INTO ENSEIGNEMENT (MAIL_ENS, NOM_MAT) values ("n.lehmann@ludus-academie.com","C");
INSERT INTO ENSEIGNEMENT (MAIL_ENS, NOM_MAT) values ("e.dentinger@ludus-academie.com","Anglais");
INSERT INTO ENSEIGNEMENT (MAIL_ENS, NOM_MAT) values ("c.muller@ludus-academie.com","Anglais");
INSERT INTO ENSEIGNEMENT (MAIL_ENS, NOM_MAT) values ("e.dentinger@ludus-academie.com","Anglais");
INSERT INTO ENSEIGNEMENT (MAIL_ENS, NOM_MAT) values ("n.lehmann@ludus-academie.com","C");
INSERT INTO ENSEIGNEMENT (MAIL_ENS, NOM_MAT) values ("n.lehmann@ludus-academie.com","C");
INSERT INTO ENSEIGNEMENT (MAIL_ENS, NOM_MAT) values ("n.lehmann@ludus-academie.com","C");
INSERT INTO ENSEIGNEMENT (MAIL_ENS, NOM_MAT) values ("n.lehmann@ludus-academie.com","C");
INSERT INTO ENSEIGNEMENT (MAIL_ENS, NOM_MAT) values ("c.muller@ludus-academie.com","Anglais");
INSERT INTO ENSEIGNEMENT (MAIL_ENS, NOM_MAT) values ("e.dentinger@ludus-academie.com","Anglais");
INSERT INTO ENSEIGNEMENT (MAIL_ENS, NOM_MAT) values ("g.madembo@ludus-academie.com","Web");

/* Cours */

INSERT INTO COURS (HEUREDEBUT, HEUREFIN, JOUR, MAIL_ENS, NOM_CLA, NOM_MAT, NOM_SAL, NOM_TYPE) values ("10:00:00","12:00:00", "Jeudi","m.besmond@ludus-academie.com","F32","Japonais","Pokemon","CM");
INSERT INTO COURS (HEUREDEBUT, HEUREFIN, JOUR, MAIL_ENS, NOM_CLA, NOM_MAT, NOM_SAL, NOM_TYPE) values ("12:00:00","14:00:00", "Vendredi","n.lehmann@ludus-academie.com","F13","C","VR","TP");
INSERT INTO COURS (HEUREDEBUT, HEUREFIN, JOUR, MAIL_ENS, NOM_CLA, NOM_MAT, NOM_SAL, NOM_TYPE) values ("12:00:00","14:00:00", "Mardi","m.besmond@ludus-academie.com","F11","Japonais","Sonic","TP");
INSERT INTO COURS (HEUREDEBUT, HEUREFIN, JOUR, MAIL_ENS, NOM_CLA, NOM_MAT, NOM_SAL, NOM_TYPE) values ("16:00:00","18:00:00", "Mercredi","t.couilles@ludus-academie.com","F13","IA","Mario","TP");
INSERT INTO COURS (HEUREDEBUT, HEUREFIN, JOUR, MAIL_ENS, NOM_CLA, NOM_MAT, NOM_SAL, NOM_TYPE) values ("13:00:00","15:00:00", "Mercredi","n.lehmann@ludus-academie.com","M1","C","VR","CM");
INSERT INTO COURS (HEUREDEBUT, HEUREFIN, JOUR, MAIL_ENS, NOM_CLA, NOM_MAT, NOM_SAL, NOM_TYPE) values ("10:00:00","12:00:00", "Mercredi","m.besmond@ludus-academie.com","F32","Japonais","Pokemon","TP");
INSERT INTO COURS (HEUREDEBUT, HEUREFIN, JOUR, MAIL_ENS, NOM_CLA, NOM_MAT, NOM_SAL, NOM_TYPE) values ("11:00:00","13:00:00", "Mardi","m.besmond@ludus-academie.com","F12","Japonais","Kirby","CM");
INSERT INTO COURS (HEUREDEBUT, HEUREFIN, JOUR, MAIL_ENS, NOM_CLA, NOM_MAT, NOM_SAL, NOM_TYPE) values ("16:00:00","18:00:00", "Jeudi","e.dentinger@ludus-academie.com","F31","Anglais","Sonic","TP");
INSERT INTO COURS (HEUREDEBUT, HEUREFIN, JOUR, MAIL_ENS, NOM_CLA, NOM_MAT, NOM_SAL, NOM_TYPE) values ("10:00:00","12:00:00", "Vendredi","c.muller@ludus-academie.com","F31","Anglais","Mario","TP");
INSERT INTO COURS (HEUREDEBUT, HEUREFIN, JOUR, MAIL_ENS, NOM_CLA, NOM_MAT, NOM_SAL, NOM_TYPE) values ("9:00:00","11:00:00", "Lundi","n.lehmann@ludus-academie.com","F32","C","Mario","TP");
INSERT INTO COURS (HEUREDEBUT, HEUREFIN, JOUR, MAIL_ENS, NOM_CLA, NOM_MAT, NOM_SAL, NOM_TYPE) values ("11:00:00","13:00:00", "Jeudi","m.besmond@ludus-academie.com","F21","Japonais","Mario","TP");
INSERT INTO COURS (HEUREDEBUT, HEUREFIN, JOUR, MAIL_ENS, NOM_CLA, NOM_MAT, NOM_SAL, NOM_TYPE) values ("12:00:00","14:00:00", "Lundi","c.muller@ludus-academie.com","F12","Anglais","Croft","TP");
INSERT INTO COURS (HEUREDEBUT, HEUREFIN, JOUR, MAIL_ENS, NOM_CLA, NOM_MAT, NOM_SAL, NOM_TYPE) values ("15:00:00","17:00:00", "Mercredi","m.besmond@ludus-academie.com","F13","Japonais","Kirby","TP");
INSERT INTO COURS (HEUREDEBUT, HEUREFIN, JOUR, MAIL_ENS, NOM_CLA, NOM_MAT, NOM_SAL, NOM_TYPE) values ("16:00:00","18:00:00", "Vendredi","m.besmond@ludus-academie.com","F11","Japonais","Pokemon","CM");
INSERT INTO COURS (HEUREDEBUT, HEUREFIN, JOUR, MAIL_ENS, NOM_CLA, NOM_MAT, NOM_SAL, NOM_TYPE) values ("16:00:00","18:00:00", "Jeudi","e.dentinger@ludus-academie.com","M2","Anglais","Kirby","TP");
INSERT INTO COURS (HEUREDEBUT, HEUREFIN, JOUR, MAIL_ENS, NOM_CLA, NOM_MAT, NOM_SAL, NOM_TYPE) values ("12:00:00","14:00:00", "Jeudi","g.madembo@ludus-academie.com","M2","Web","Pokemon","TP");
INSERT INTO COURS (HEUREDEBUT, HEUREFIN, JOUR, MAIL_ENS, NOM_CLA, NOM_MAT, NOM_SAL, NOM_TYPE) values ("10:00:00","12:00:00", "Jeudi","n.lehmann@ludus-academie.com","F12","C","VR","TP");
INSERT INTO COURS (HEUREDEBUT, HEUREFIN, JOUR, MAIL_ENS, NOM_CLA, NOM_MAT, NOM_SAL, NOM_TYPE) values ("15:00:00","17:00:00", "Mercredi","t.couilles@ludus-academie.com","F14","IA","Croft","TP");
INSERT INTO COURS (HEUREDEBUT, HEUREFIN, JOUR, MAIL_ENS, NOM_CLA, NOM_MAT, NOM_SAL, NOM_TYPE) values ("13:00:00","15:00:00", "Lundi","g.madembo@ludus-academie.com","M1","Web","VR","TP");
INSERT INTO COURS (HEUREDEBUT, HEUREFIN, JOUR, MAIL_ENS, NOM_CLA, NOM_MAT, NOM_SAL, NOM_TYPE) values ("11:00:00","13:00:00", "Mercredi","t.couilles@ludus-academie.com","F22","IA","Mario","CM");
INSERT INTO COURS (HEUREDEBUT, HEUREFIN, JOUR, MAIL_ENS, NOM_CLA, NOM_MAT, NOM_SAL, NOM_TYPE) values ("16:00:00","18:00:00", "Vendredi","m.besmond@ludus-academie.com","F32","Japonais","Croft","TP");
INSERT INTO COURS (HEUREDEBUT, HEUREFIN, JOUR, MAIL_ENS, NOM_CLA, NOM_MAT, NOM_SAL, NOM_TYPE) values ("13:00:00","15:00:00", "Jeudi","t.couilles@ludus-academie.com","F11","IA","VR","TP");
INSERT INTO COURS (HEUREDEBUT, HEUREFIN, JOUR, MAIL_ENS, NOM_CLA, NOM_MAT, NOM_SAL, NOM_TYPE) values ("15:00:00","17:00:00", "Mercredi","g.madembo@ludus-academie.com","F11","Web","Pokemon","CM");
INSERT INTO COURS (HEUREDEBUT, HEUREFIN, JOUR, MAIL_ENS, NOM_CLA, NOM_MAT, NOM_SAL, NOM_TYPE) values ("9:00:00","11:00:00", "Jeudi","c.muller@ludus-academie.com","F22","Anglais","Mario","CM");
INSERT INTO COURS (HEUREDEBUT, HEUREFIN, JOUR, MAIL_ENS, NOM_CLA, NOM_MAT, NOM_SAL, NOM_TYPE) values ("9:00:00","11:00:00", "Vendredi","t.couilles@ludus-academie.com","F14","IA","Mario","TP");
INSERT INTO COURS (HEUREDEBUT, HEUREFIN, JOUR, MAIL_ENS, NOM_CLA, NOM_MAT, NOM_SAL, NOM_TYPE) values ("11:00:00","13:00:00", "Mercredi","g.madembo@ludus-academie.com","M2","Web","Kirby","TP");
INSERT INTO COURS (HEUREDEBUT, HEUREFIN, JOUR, MAIL_ENS, NOM_CLA, NOM_MAT, NOM_SAL, NOM_TYPE) values ("9:00:00","11:00:00", "Jeudi","m.besmond@ludus-academie.com","F11","Japonais","Croft","TP");
INSERT INTO COURS (HEUREDEBUT, HEUREFIN, JOUR, MAIL_ENS, NOM_CLA, NOM_MAT, NOM_SAL, NOM_TYPE) values ("11:00:00","13:00:00", "Mercredi","t.couilles@ludus-academie.com","F13","IA","Pokemon","CM");
INSERT INTO COURS (HEUREDEBUT, HEUREFIN, JOUR, MAIL_ENS, NOM_CLA, NOM_MAT, NOM_SAL, NOM_TYPE) values ("16:00:00","18:00:00", "Vendredi","t.couilles@ludus-academie.com","F14","IA","Pokemon","CM");
INSERT INTO COURS (HEUREDEBUT, HEUREFIN, JOUR, MAIL_ENS, NOM_CLA, NOM_MAT, NOM_SAL, NOM_TYPE) values ("12:00:00","14:00:00", "Mercredi","t.couilles@ludus-academie.com","M1","IA","Pokemon","CM");
INSERT INTO COURS (HEUREDEBUT, HEUREFIN, JOUR, MAIL_ENS, NOM_CLA, NOM_MAT, NOM_SAL, NOM_TYPE) values ("9:00:00","11:00:00", "Mardi","t.couilles@ludus-academie.com","F13","IA","Mario","CM");
INSERT INTO COURS (HEUREDEBUT, HEUREFIN, JOUR, MAIL_ENS, NOM_CLA, NOM_MAT, NOM_SAL, NOM_TYPE) values ("9:00:00","11:00:00", "Lundi","n.lehmann@ludus-academie.com","F21","C","VR","TP");
INSERT INTO COURS (HEUREDEBUT, HEUREFIN, JOUR, MAIL_ENS, NOM_CLA, NOM_MAT, NOM_SAL, NOM_TYPE) values ("9:00:00","11:00:00", "Jeudi","t.couilles@ludus-academie.com","M1","IA","VR","TP");
INSERT INTO COURS (HEUREDEBUT, HEUREFIN, JOUR, MAIL_ENS, NOM_CLA, NOM_MAT, NOM_SAL, NOM_TYPE) values ("11:00:00","13:00:00", "Mardi","n.lehmann@ludus-academie.com","F21","C","Mario","TP");
INSERT INTO COURS (HEUREDEBUT, HEUREFIN, JOUR, MAIL_ENS, NOM_CLA, NOM_MAT, NOM_SAL, NOM_TYPE) values ("14:00:00","16:00:00", "Jeudi","g.madembo@ludus-academie.com","F22","Web","Mario","TP");
INSERT INTO COURS (HEUREDEBUT, HEUREFIN, JOUR, MAIL_ENS, NOM_CLA, NOM_MAT, NOM_SAL, NOM_TYPE) values ("15:00:00","17:00:00", "Jeudi","n.lehmann@ludus-academie.com","M2","C","Sonic","CM");
INSERT INTO COURS (HEUREDEBUT, HEUREFIN, JOUR, MAIL_ENS, NOM_CLA, NOM_MAT, NOM_SAL, NOM_TYPE) values ("16:00:00","18:00:00", "Jeudi","n.lehmann@ludus-academie.com","M2","C","Mario","TP");
INSERT INTO COURS (HEUREDEBUT, HEUREFIN, JOUR, MAIL_ENS, NOM_CLA, NOM_MAT, NOM_SAL, NOM_TYPE) values ("11:00:00","13:00:00", "Vendredi","g.madembo@ludus-academie.com","F21","Web","Croft","CM");
INSERT INTO COURS (HEUREDEBUT, HEUREFIN, JOUR, MAIL_ENS, NOM_CLA, NOM_MAT, NOM_SAL, NOM_TYPE) values ("13:00:00","15:00:00", "Vendredi","g.madembo@ludus-academie.com","F13","Web","Mario","TP");
INSERT INTO COURS (HEUREDEBUT, HEUREFIN, JOUR, MAIL_ENS, NOM_CLA, NOM_MAT, NOM_SAL, NOM_TYPE) values ("10:00:00","12:00:00", "Jeudi","n.lehmann@ludus-academie.com","M2","C","Mario","TP");
INSERT INTO COURS (HEUREDEBUT, HEUREFIN, JOUR, MAIL_ENS, NOM_CLA, NOM_MAT, NOM_SAL, NOM_TYPE) values ("15:00:00","17:00:00", "Mercredi","m.besmond@ludus-academie.com","M2","Japonais","VR","TP");
INSERT INTO COURS (HEUREDEBUT, HEUREFIN, JOUR, MAIL_ENS, NOM_CLA, NOM_MAT, NOM_SAL, NOM_TYPE) values ("10:00:00","12:00:00", "Jeudi","c.muller@ludus-academie.com","F32","Anglais","Pokemon","TP");
INSERT INTO COURS (HEUREDEBUT, HEUREFIN, JOUR, MAIL_ENS, NOM_CLA, NOM_MAT, NOM_SAL, NOM_TYPE) values ("10:00:00","12:00:00", "Lundi","n.lehmann@ludus-academie.com","M2","C","Croft","TP");
INSERT INTO COURS (HEUREDEBUT, HEUREFIN, JOUR, MAIL_ENS, NOM_CLA, NOM_MAT, NOM_SAL, NOM_TYPE) values ("16:00:00","18:00:00", "Lundi","g.madembo@ludus-academie.com","F32","Web","Mario","TP");
INSERT INTO COURS (HEUREDEBUT, HEUREFIN, JOUR, MAIL_ENS, NOM_CLA, NOM_MAT, NOM_SAL, NOM_TYPE) values ("14:00:00","16:00:00", "Jeudi","n.lehmann@ludus-academie.com","F11","C","Kirby","CM");
INSERT INTO COURS (HEUREDEBUT, HEUREFIN, JOUR, MAIL_ENS, NOM_CLA, NOM_MAT, NOM_SAL, NOM_TYPE) values ("13:00:00","15:00:00", "Lundi","g.madembo@ludus-academie.com","F13","Web","Pokemon","TP");

/* Enseignants */

INSERT INTO ENSEIGNANT (DATENAISS_ENS, MAIL_ENS, NOM_ENS, PRENOM_ENS, SEXE_ENS) values ("1993/3/17","n.lehmann@ludus-academie.com","Lehmann","Nicolas","H");
INSERT INTO ENSEIGNANT (DATENAISS_ENS, MAIL_ENS, NOM_ENS, PRENOM_ENS, SEXE_ENS) values ("1999/7/18","n.loth@ludus-academie.com","Loth","Nicolas","H");
INSERT INTO ENSEIGNANT (DATENAISS_ENS, MAIL_ENS, NOM_ENS, PRENOM_ENS, SEXE_ENS) values ("1990/5/8","m.besmond@ludus-academie.com","Besmond","Marine","H");
INSERT INTO ENSEIGNANT (DATENAISS_ENS, MAIL_ENS, NOM_ENS, PRENOM_ENS, SEXE_ENS) values ("2000/11/19","g.madembo@ludus-academie.com","Madembo","Grace","H");
INSERT INTO ENSEIGNANT (DATENAISS_ENS, MAIL_ENS, NOM_ENS, PRENOM_ENS, SEXE_ENS) values ("2000/9/18","c.muller@ludus-academie.com","Muller","Charley","H");
INSERT INTO ENSEIGNANT (DATENAISS_ENS, MAIL_ENS, NOM_ENS, PRENOM_ENS, SEXE_ENS) values ("2000/7/19","e.dentinger@ludus-academie.com","Dentinger","Emelyne","H");
INSERT INTO ENSEIGNANT (DATENAISS_ENS, MAIL_ENS, NOM_ENS, PRENOM_ENS, SEXE_ENS) values ("1999/2/11","t.couilles@ludus-academie.com","Couilles","Thomas","H");

/*Etudiants F1*/

INSERT INTO ETUDIANT (DATENAISS, MAIL_ETU,NOM_CLA,NOM,PRENOM, SEXE) values ("1992/6/12","a.acker@ludus-academie.com","F11","ACKER","Arnaud","H");
INSERT INTO ETUDIANT (DATENAISS, MAIL_ETU,NOM_CLA,NOM,PRENOM, SEXE) values ("1993/3/11","a.andriamiandrarivo@ludus-academie.com","F11","ANDRIAMIANDRARIVO","Hubert Brayan","H");
INSERT INTO ETUDIANT (DATENAISS, MAIL_ETU,NOM_CLA,NOM,PRENOM, SEXE) values ("1996/5/26","a.andriolo@ludus-academie.com","F12","ANDRIOLO","Caroline","F");
INSERT INTO ETUDIANT (DATENAISS, MAIL_ETU,NOM_CLA,NOM,PRENOM, SEXE) values ("1994/1/9","a.aulen@ludus-academie.com","F11","AULEN","Lucas","H");
INSERT INTO ETUDIANT (DATENAISS, MAIL_ETU,NOM_CLA,NOM,PRENOM, SEXE) values ("2000/10/1","a.aydin@ludus-academie.com","F12","AYDIN","Kadir","H");
INSERT INTO ETUDIANT (DATENAISS, MAIL_ETU,NOM_CLA,NOM,PRENOM, SEXE) values ("1999/1/30","b.balson@ludus-academie.com","F11","BALSON","Yann","H");
INSERT INTO ETUDIANT (DATENAISS, MAIL_ETU,NOM_CLA,NOM,PRENOM, SEXE) values ("1996/11/25","b.biton@ludus-academie.com","F11","BITON","Jocelyn","H");
INSERT INTO ETUDIANT (DATENAISS, MAIL_ETU,NOM_CLA,NOM,PRENOM, SEXE) values ("1991/10/5","b.borgondo@ludus-academie.com","F11","BORGONDO","David","H");
INSERT INTO ETUDIANT (DATENAISS, MAIL_ETU,NOM_CLA,NOM,PRENOM, SEXE) values ("1999/3/12","b.boulaajoul@ludus-academie.com","F14","BOULAAJOUL","Badr","H");
INSERT INTO ETUDIANT (DATENAISS, MAIL_ETU,NOM_CLA,NOM,PRENOM, SEXE) values ("1998/5/14","b.buttani@ludus-academie.com","F13","BUTTANI","Justine","F");
INSERT INTO ETUDIANT (DATENAISS, MAIL_ETU,NOM_CLA,NOM,PRENOM, SEXE) values ("1990/4/18","c.claude@ludus-academie.com","F12","CLAUDE","Leo","H");
INSERT INTO ETUDIANT (DATENAISS, MAIL_ETU,NOM_CLA,NOM,PRENOM, SEXE) values ("1999/4/16","c.cragnolini@ludus-academie.com","F14","CRAGNOLINI","Julien","H");
INSERT INTO ETUDIANT (DATENAISS, MAIL_ETU,NOM_CLA,NOM,PRENOM, SEXE) values ("2000/1/26","d.de chenerilles@ludus-academie.com","F11","DE CHENERILLES","Pablo","H");
INSERT INTO ETUDIANT (DATENAISS, MAIL_ETU,NOM_CLA,NOM,PRENOM, SEXE) values ("1996/11/19","d.deveze@ludus-academie.com","F14","DEVEZE","Killian","H");
INSERT INTO ETUDIANT (DATENAISS, MAIL_ETU,NOM_CLA,NOM,PRENOM, SEXE) values ("1993/8/28","d.dietschin@ludus-academie.com","F12","DIETSCHIN","Valentin","H");
INSERT INTO ETUDIANT (DATENAISS, MAIL_ETU,NOM_CLA,NOM,PRENOM, SEXE) values ("1997/5/2","e.eschke@ludus-academie.com","F12","ESCHKE","Thomas ","H");
INSERT INTO ETUDIANT (DATENAISS, MAIL_ETU,NOM_CLA,NOM,PRENOM, SEXE) values ("1993/8/4","f.fache@ludus-academie.com","F11","FACHE","Bruno","H");
INSERT INTO ETUDIANT (DATENAISS, MAIL_ETU,NOM_CLA,NOM,PRENOM, SEXE) values ("1998/4/29","f.fernandes@ludus-academie.com","F14","FERNANDES","Yoann","H");
INSERT INTO ETUDIANT (DATENAISS, MAIL_ETU,NOM_CLA,NOM,PRENOM, SEXE) values ("1990/9/30","f.freymann@ludus-academie.com","F11","FREYMANN","Ludwig","H");
INSERT INTO ETUDIANT (DATENAISS, MAIL_ETU,NOM_CLA,NOM,PRENOM, SEXE) values ("1994/3/8","f.fuchs@ludus-academie.com","F11","FUCHS","Emilien","H");
INSERT INTO ETUDIANT (DATENAISS, MAIL_ETU,NOM_CLA,NOM,PRENOM, SEXE) values ("1999/2/7","g.galati@ludus-academie.com","F13","GALATI","Gaetan","H");
INSERT INTO ETUDIANT (DATENAISS, MAIL_ETU,NOM_CLA,NOM,PRENOM, SEXE) values ("1997/8/3","g.gau@ludus-academie.com","F13","GAU","Pierre-Alain","H");
INSERT INTO ETUDIANT (DATENAISS, MAIL_ETU,NOM_CLA,NOM,PRENOM, SEXE) values ("1999/10/12","g.gawlik@ludus-academie.com","F14","GAWLIK","Alexis","H");
INSERT INTO ETUDIANT (DATENAISS, MAIL_ETU,NOM_CLA,NOM,PRENOM, SEXE) values ("1990/6/16","g.gerges@ludus-academie.com","F14","GERGES","Celine","F");
INSERT INTO ETUDIANT (DATENAISS, MAIL_ETU,NOM_CLA,NOM,PRENOM, SEXE) values ("1991/11/10","g.goetz@ludus-academie.com","F12","GOETZ","Thibaud","H");
INSERT INTO ETUDIANT (DATENAISS, MAIL_ETU,NOM_CLA,NOM,PRENOM, SEXE) values ("1995/4/22","g.grimaz@ludus-academie.com","F14","GRIMAZ","Jeremie","H");
INSERT INTO ETUDIANT (DATENAISS, MAIL_ETU,NOM_CLA,NOM,PRENOM, SEXE) values ("1993/11/9","h.haas@ludus-academie.com","F12","HAAS","Mathieu","H");
INSERT INTO ETUDIANT (DATENAISS, MAIL_ETU,NOM_CLA,NOM,PRENOM, SEXE) values ("1997/3/12","h.hajnal@ludus-academie.com","F12","HAJNAL","Florian","H");
INSERT INTO ETUDIANT (DATENAISS, MAIL_ETU,NOM_CLA,NOM,PRENOM, SEXE) values ("1999/7/8","h.helfer@ludus-academie.com","F13","HELFER","Antoine","H");
INSERT INTO ETUDIANT (DATENAISS, MAIL_ETU,NOM_CLA,NOM,PRENOM, SEXE) values ("1990/4/26","h.hoel@ludus-academie.com","F14","HOEL","Julien","H");
INSERT INTO ETUDIANT (DATENAISS, MAIL_ETU,NOM_CLA,NOM,PRENOM, SEXE) values ("1995/3/5","h.hossann@ludus-academie.com","F11","HOSSANN","Vincent","H");
INSERT INTO ETUDIANT (DATENAISS, MAIL_ETU,NOM_CLA,NOM,PRENOM, SEXE) values ("1998/12/7","i.iss@ludus-academie.com","F14","ISS","Fiona","F");
INSERT INTO ETUDIANT (DATENAISS, MAIL_ETU,NOM_CLA,NOM,PRENOM, SEXE) values ("1994/1/11","k.kayser@ludus-academie.com","F13","KAYSER","Matthieu","H");
INSERT INTO ETUDIANT (DATENAISS, MAIL_ETU,NOM_CLA,NOM,PRENOM, SEXE) values ("1993/11/24","l.lamarre@ludus-academie.com","F13","LAMARRE","Benoit","H");
INSERT INTO ETUDIANT (DATENAISS, MAIL_ETU,NOM_CLA,NOM,PRENOM, SEXE) values ("1993/2/7","l.laskowski@ludus-academie.com","F14","LASKOWSKI","Axel","H");
INSERT INTO ETUDIANT (DATENAISS, MAIL_ETU,NOM_CLA,NOM,PRENOM, SEXE) values ("1999/3/15","l.lorange@ludus-academie.com","F11","LORANGE","Pauline","H");
INSERT INTO ETUDIANT (DATENAISS, MAIL_ETU,NOM_CLA,NOM,PRENOM, SEXE) values ("1998/1/3","m.mader@ludus-academie.com","F12","MADER","Maxime","H");
INSERT INTO ETUDIANT (DATENAISS, MAIL_ETU,NOM_CLA,NOM,PRENOM, SEXE) values ("1990/4/18","m.maggay@ludus-academie.com","F12","MAGGAY","Cedric","H");
INSERT INTO ETUDIANT (DATENAISS, MAIL_ETU,NOM_CLA,NOM,PRENOM, SEXE) values ("2000/10/25","m.mathieu@ludus-academie.com","F13","MATHIEU","Tristan","H");
INSERT INTO ETUDIANT (DATENAISS, MAIL_ETU,NOM_CLA,NOM,PRENOM, SEXE) values ("1997/11/2","m.mock@ludus-academie.com","F12","MOCK","Romain","H");
INSERT INTO ETUDIANT (DATENAISS, MAIL_ETU,NOM_CLA,NOM,PRENOM, SEXE) values ("1992/2/6","n.noiret-lemaire@ludus-academie.com","F12","NOIRET-LEMAIRE","Lenny","H");
INSERT INTO ETUDIANT (DATENAISS, MAIL_ETU,NOM_CLA,NOM,PRENOM, SEXE) values ("1997/2/26","n.noyon@ludus-academie.com","F12","NOYON","Nathan","H");
INSERT INTO ETUDIANT (DATENAISS, MAIL_ETU,NOM_CLA,NOM,PRENOM, SEXE) values ("1996/6/5","p.prob@ludus-academie.com","F11","PROB","Bastien","H");
INSERT INTO ETUDIANT (DATENAISS, MAIL_ETU,NOM_CLA,NOM,PRENOM, SEXE) values ("1994/8/1","q.quenet@ludus-academie.com","F11","QUENET","Raphael","H");
INSERT INTO ETUDIANT (DATENAISS, MAIL_ETU,NOM_CLA,NOM,PRENOM, SEXE) values ("1997/11/10","r.rochas@ludus-academie.com","F14","ROCHAS","Valentin","H");
INSERT INTO ETUDIANT (DATENAISS, MAIL_ETU,NOM_CLA,NOM,PRENOM, SEXE) values ("1999/1/16","r.roux@ludus-academie.com","F13","ROUX","Anthony","H");
INSERT INTO ETUDIANT (DATENAISS, MAIL_ETU,NOM_CLA,NOM,PRENOM, SEXE) values ("1993/12/14","s.saint julien@ludus-academie.com","F12","SAINT JULIEN","Joffrey","H");
INSERT INTO ETUDIANT (DATENAISS, MAIL_ETU,NOM_CLA,NOM,PRENOM, SEXE) values ("1993/10/16","s.scheer-alm@ludus-academie.com","F12","SCHEER-ALM","Benjamin Claude","H");
INSERT INTO ETUDIANT (DATENAISS, MAIL_ETU,NOM_CLA,NOM,PRENOM, SEXE) values ("1991/1/17","s.schnee@ludus-academie.com","F13","SCHNEE","Louis","H");
INSERT INTO ETUDIANT (DATENAISS, MAIL_ETU,NOM_CLA,NOM,PRENOM, SEXE) values ("2000/6/21","s.simon@ludus-academie.com","F14","SIMON","Pierre-Andre","H");
INSERT INTO ETUDIANT (DATENAISS, MAIL_ETU,NOM_CLA,NOM,PRENOM, SEXE) values ("1993/4/16","u.ubrig@ludus-academie.com","F13","UBRIG","Joric","H");
INSERT INTO ETUDIANT (DATENAISS, MAIL_ETU,NOM_CLA,NOM,PRENOM, SEXE) values ("1998/4/6","v.veltz@ludus-academie.com","F11","VELTZ","Quentin","H");
INSERT INTO ETUDIANT (DATENAISS, MAIL_ETU,NOM_CLA,NOM,PRENOM, SEXE) values ("2000/11/6","v.vie@ludus-academie.com","F14","VIE","Loic","H");
INSERT INTO ETUDIANT (DATENAISS, MAIL_ETU,NOM_CLA,NOM,PRENOM, SEXE) values ("1992/1/17","v.vindigni@ludus-academie.com","F13","VINDIGNI","Fabio","H");
INSERT INTO ETUDIANT (DATENAISS, MAIL_ETU,NOM_CLA,NOM,PRENOM, SEXE) values ("2000/3/19","v.virion@ludus-academie.com","F14","VIRION","Louis","H");
INSERT INTO ETUDIANT (DATENAISS, MAIL_ETU,NOM_CLA,NOM,PRENOM, SEXE) values ("1996/1/11","w.wallisch@ludus-academie.com","F11","WALLISCH","Alexis","H");
INSERT INTO ETUDIANT (DATENAISS, MAIL_ETU,NOM_CLA,NOM,PRENOM, SEXE) values ("1995/10/30","w.werly@ludus-academie.com","F13","WERLY","Tomeline","F");
INSERT INTO ETUDIANT (DATENAISS, MAIL_ETU,NOM_CLA,NOM,PRENOM, SEXE) values ("1997/7/16","w.wilhelm@ludus-academie.com","F13","WILHELM","Stephane","H");
INSERT INTO ETUDIANT (DATENAISS, MAIL_ETU,NOM_CLA,NOM,PRENOM, SEXE) values ("1998/5/1","z.zimmer@ludus-academie.com","F14","ZIMMER","Noe","H");

/* Etudiants F2 */

INSERT INTO ETUDIANT (DATENAISS, MAIL_ETU,NOM_CLA,NOM,PRENOM, SEXE) values ("1992/5/11","g.alves@ludus-academie.com","F22","ALVES","Guillaume","H");
INSERT INTO ETUDIANT (DATENAISS, MAIL_ETU,NOM_CLA,NOM,PRENOM, SEXE) values ("1990/6/25","a.barthlen@ludus-academie.com","F22","BARTHLEN","Arthur","H");
INSERT INTO ETUDIANT (DATENAISS, MAIL_ETU,NOM_CLA,NOM,PRENOM, SEXE) values ("1998/11/20","m.bazin@ludus-academie.com","F21","BAZIN","Maxime","H");
INSERT INTO ETUDIANT (DATENAISS, MAIL_ETU,NOM_CLA,NOM,PRENOM, SEXE) values ("1996/11/7","t.denny@ludus-academie.com","F22","DENNY","Thibaut","H");
INSERT INTO ETUDIANT (DATENAISS, MAIL_ETU,NOM_CLA,NOM,PRENOM, SEXE) values ("1993/3/9","a.elbertse@ludus-academie.com","F22","ELBERTSE","Alexy","H");
INSERT INTO ETUDIANT (DATENAISS, MAIL_ETU,NOM_CLA,NOM,PRENOM, SEXE) values ("1993/11/15","a.giovinazzo@ludus-academie.com","F21","GIOVINAZZO","Alexis","H");
INSERT INTO ETUDIANT (DATENAISS, MAIL_ETU,NOM_CLA,NOM,PRENOM, SEXE) values ("1999/2/4","m.guerrero@ludus-academie.com","F21","GUERRERO","Maxime","H");
INSERT INTO ETUDIANT (DATENAISS, MAIL_ETU,NOM_CLA,NOM,PRENOM, SEXE) values ("1999/3/8","a.hernandez@ludus-academie.com","F22","HERNANDEZ","Alexis","H");
INSERT INTO ETUDIANT (DATENAISS, MAIL_ETU,NOM_CLA,NOM,PRENOM, SEXE) values ("1996/11/5","f.herrmann@ludus-academie.com","F21","HERRMANN","Florian","H");
INSERT INTO ETUDIANT (DATENAISS, MAIL_ETU,NOM_CLA,NOM,PRENOM, SEXE) values ("1998/1/16","p.kergrohen@ludus-academie.com","F21","KERGROHEN","Pierre-Yves","H");
INSERT INTO ETUDIANT (DATENAISS, MAIL_ETU,NOM_CLA,NOM,PRENOM, SEXE) values ("2000/1/16","a.lamour@ludus-academie.com","F21","LAMOUR","Anthony","H");
INSERT INTO ETUDIANT (DATENAISS, MAIL_ETU,NOM_CLA,NOM,PRENOM, SEXE) values ("1994/8/21","a.martin@ludus-academie.com","F21","MARTIN","Alexandre","H");
INSERT INTO ETUDIANT (DATENAISS, MAIL_ETU,NOM_CLA,NOM,PRENOM, SEXE) values ("1990/4/30","l.monnier@ludus-academie.com","F22","MONNIER","Laetitia","F");
INSERT INTO ETUDIANT (DATENAISS, MAIL_ETU,NOM_CLA,NOM,PRENOM, SEXE) values ("1997/7/4","l.moriconi@ludus-academie.com","F22","MORICONI","Lenny","H");
INSERT INTO ETUDIANT (DATENAISS, MAIL_ETU,NOM_CLA,NOM,PRENOM, SEXE) values ("1993/7/29","k.pin@ludus-academie.com","F22","PIN","Killian","H");
INSERT INTO ETUDIANT (DATENAISS, MAIL_ETU,NOM_CLA,NOM,PRENOM, SEXE) values ("1993/4/9","a.rinck@ludus-academie.com","F22","RINCK","Adrien","H");
INSERT INTO ETUDIANT (DATENAISS, MAIL_ETU,NOM_CLA,NOM,PRENOM, SEXE) values ("1991/7/13","c.roche@ludus-academie.com","F21","ROCHE","Charles","H");
INSERT INTO ETUDIANT (DATENAISS, MAIL_ETU,NOM_CLA,NOM,PRENOM, SEXE) values ("1993/5/29","f.trichet@ludus-academie.com","F22","TRICHET","Florentin","H");
INSERT INTO ETUDIANT (DATENAISS, MAIL_ETU,NOM_CLA,NOM,PRENOM, SEXE) values ("1991/7/19","g.unalan@ludus-academie.com","F21","UNALAN","Gokhan","H");
INSERT INTO ETUDIANT (DATENAISS, MAIL_ETU,NOM_CLA,NOM,PRENOM, SEXE) values ("1992/5/25","a.wahler@ludus-academie.com","F22","WAHLER","Adrian","H");
INSERT INTO ETUDIANT (DATENAISS, MAIL_ETU,NOM_CLA,NOM,PRENOM, SEXE) values ("1999/9/15","w.weiler@ludus-academie.com","F21","WEILER","William","H");
INSERT INTO ETUDIANT (DATENAISS, MAIL_ETU,NOM_CLA,NOM,PRENOM, SEXE) values ("1998/7/1","b.wendling@ludus-academie.com","F21","WENDLING","Bruno","H");

