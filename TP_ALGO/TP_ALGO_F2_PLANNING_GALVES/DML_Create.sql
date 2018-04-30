create DATABASE planning;

create table NIVEAU(
	NOM_NIV char (32) not null,
	primary key (NOM_NIV)
);

create table CLASSE(
	NOM_CLA char (32) not null,
	NUM_CLA int (4) not null,
	NOM_NIV char (32) not null,
	primary key (NOM_CLA),
	foreign key (NOM_NIV) references NIVEAU
);

create table ETUDIANT(
	MAIL_ETU char (64) not null,
	NOM_CLA char (32) not null,
	NOM char (32) not null,
	PRENOM char (32) not null,
	SEXE char (1) not null,
	DATENAISS datetime(6) not null,
	primary key (MAIL_ETU),
	foreign key (NOM_CLA) references CLASSE
);

create table MATIERE(
	NOM_MAT char (32) not null,
	primary key (NOM_MAT)
);

create table ENSEIGNANT(
	MAIL_ENS char (64) not null,
	NOM_ENS char (32) not null,
	PRENOM_ENS char (32) not null,
	DATENAISS_ENS datetime(6) not null,
	SEXE_ENS char(1) not null,
	primary key (MAIL_ENS)
);

create table ENSEIGNEMENT(
	NOM_MAT char (32) not null,
	MAIL_ENS char (64) not null,
	primary key (MAIL_ENS,NOM_MAT),
	foreign key (MAIL_ENS) references ENSEIGNANT,
	foreign key (NOM_MAT) references MATIERE
);

create table TYPE_COURS(
	NOM_TYPE char (32) not null,
	primary key (NOM_TYPE)
);

create table SALLE(
	NOM_SAL char (32) not null,
	primary key (NOM_SAL)
);

create table COURS(
	HEUREDEBUT TIME(6) not null,
	HEUREFIN TIME(6) not null,
	JOUR ENUM('Lundi','Mardi','Mercredi','Jeudi','Vendredi') not null,
	NOM_CLA char (32) not null,
	NOM_TYPE char (32) not null,
	NOM_SAL char (32) not null,
	NOM_MAT char (32) not null,
	MAIL_ENS char (64) not null,
	foreign key (NOM_CLA) references CLASSE,
	foreign key (NOM_TYPE) references TYPE_COURS,
	foreign key (NOM_SAL) references SALLE,
	foreign key (NOM_MAT) references ENSEIGNEMENT,
	foreign key (MAIL_ENS) references ENSEIGNEMENT
);	