unit TP_BULLS_COWS_PAS;

{TP bulls and cows.
FOCUS sur le m�mo
BUT du jeu: Demander mot � l'utilisateur
Comparer ce mot avec les mots de votre fichier (10 mots)
S�lection al�atoire.
Tester la saisie des utilisateur. Mots saisis en majuscule ne sont pas accept�s. Caract�res sp�ciaux interdits.
Mots sans plusieurs fois la meme lettre. Mot longueur maximale.
Tester la longueur du mot et indiquer si le mot est trop petit ou trop grand, ainsi que le nombre de caract�res max � saisir.
Identifier le nombre d'essais: Nombre d'essais max en fonction de la taille du mot.
S'il y a une erreur de saisie, le nombre d'essais ne change pas (longueur, majuscules,etc..)
TAILLES DE MOTS:
  3 caract�res=4 essais
  4 caract�res=7 essais
  5 caract�res=10 essais
  6 caract�res=16 essais
  7 caract�res=20 essais

Pour chaque taille de mot, nombre d'essais (ci dessus)

Indiquer au joueur quand il perd ou quand il gagne, il peut recommencer.
}

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, jpeg, pngimage;

type
  TForm1 = class(TForm)
    B_Quitter: TButton;
    M_liste: TMemo;
    L_mot: TLabel;
    E_mot: TEdit;
    Img_bulls: TImage;
    Img_cows: TImage;
    L_score_cows: TLabel;
    L_score_bulls: TLabel;
    L_nb_car_mot: TLabel;
    L_fin: TLabel;
    L_nb_essais: TLabel;
    B_GO: TButton;
    B_Tester: TButton;
    L_nb_car: TLabel;
    L_nb_essais_mot: TLabel;
    L_score: TLabel;
    Img_fond: TImage;
    Img_score: TImage;
    procedure FormCreate(Sender: TObject);
    procedure Init;
    procedure B_QuitterClick(Sender: TObject);
    procedure B_GOClick(Sender: TObject);
    procedure SelectMot;
    procedure B_TesterClick(Sender: TObject);
    procedure Deroulement;
    procedure Cow(chaine,chaine2:STRING);
    procedure Bull(car:CHAR;chaine2:STRING);
    procedure Reboot;
    procedure Scoring;
    procedure LoadScore;
    FUNCTION fin:BOOLEAN;
    FUNCTION VerifChaine(chaine:STRING):BOOLEAN;
    FUNCTION VerifChaineTaille(chaine,chaine2:STRING):BOOLEAN;
  private
    { D�clarations priv�es }
  public
    { D�clarations publiques }
  end;


TYPE
  foi=FILE OF INTEGER;

var
  Form1: TForm1;
  mot,last_mot:STRING;
  cows,bulls,essais,score:INTEGER;
  Victoire,Defaite:BOOLEAN;
  F:foi; //Fichier de stockage du score


implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
//BUT: Effectuer une part de l'initialisation: Images, chargement de la liste, et lier le fichier score
//ENTREES: /
//SORTIES:  Lecture des fichiers image, texte
begin
ASSIGNFile(F,'..\..\Fichiers\score.bin');
Img_score.Picture.LoadFromFile('..\..\Images\sign.png');
Img_fond.Picture.LoadFromFile('..\..\Images\enclos.jpg');
Img_bulls.Picture.LoadFromFile('..\..\Images\bulls.png');
Img_cows.Picture.LoadFromFile('..\..\Images\cows.png');
M_liste.Lines.LoadFromFile('..\..\Fichiers\liste.txt');
end;

procedure TForm1.B_GOClick(Sender: TObject);
//BUT:  Appeler les proc�dures de disposition du d�but de partie
//ENTREES:  Input click de l'utilisateur
//SORTIES:  Appel proc�dures Init et SelectMot
begin
Init;
SelectMot;
end;

procedure TForm1.Init;
//BUT:  Initialiser les �tats
//ENTREES:  /
//SORTIES:   Affichage/Dissimulation des objets et assignation des scores � 0
BEGIN
E_mot.SetFocus;
B_GO.Visible:=FALSE;
B_Tester.Visible:=TRUE;
L_nb_car.Visible:=TRUE;
L_nb_essais.Visible:=TRUE;
L_nb_car_mot.Visible:=TRUE;
L_nb_essais_mot.Visible:=TRUE;
L_fin.Visible:=FALSE;
L_score_bulls.Caption:='0';
L_score_cows.Caption:='0';
END;

procedure TForm1.LoadScore;
//BUT:  R�cup�rer le score stock� dans la variable F de type foi
//ENTREES:  Donn�es score de F
//SORTIES:  Stockage du score dans le label correspondant
BEGIN
RESET(F);
read(F,score);
CLOSEFILE(F);
L_score.Caption:=INTTOSTR(score);
END;

procedure TForm1.SelectMot;
//BUT:  Selectionner un mot al�atoire dans la liste charg�e et assigner la difficult� en cons�quence
//ENTREES:  Mot de la liste
//SORTIES:  Assignation variable essais, et labels correspondants
BEGIN
  REPEAT
  mot:=M_liste.Lines[random(M_liste.Lines.Count)];
  UNTIL (mot<>last_mot);
  case length(mot) of
    3:essais:=4;
    4:essais:=7;
    5:essais:=10;
    6:essais:=16;
    7:essais:=20;
  end;
  L_nb_car_mot.Caption:=INTTOSTR(length(mot));
  L_nb_essais_mot.Caption:=INTTOSTR(essais);
END;

procedure TForm1.B_TesterClick(Sender: TObject);
//BUT:  Appeler la proc�dure d�roulement et d�cr�menter le nombre d'essais
//ENTREES:  Click utilisateur
//SORTIES:  Appel proc�dure Deroulement et assignation label essais
begin
  Deroulement;
  L_nb_essais_mot.Caption:=INTTOSTR(essais);
end;

procedure TForm1.Deroulement;
//BUT:  Appels des proc�dures de v�rification de la chaine entr�e par l'utilisateur, Appels proc�dures bull et cow + fin
//ENTREES:  Variable mot ( mot � deviner ), et chaine entr�e par l'utilisateur
//SORTIES:  Assignation des scores et des zones de texte correspondantes;
BEGIN
  IF VerifChaineTaille(E_mot.Text,mot) OR VerifChaine(E_mot.Text) THEN
    E_mot.Text:=''
  ELSE
    BEGIN
      cows:=0;
      bulls:=0;
      Cow(E_mot.Text,mot);
      L_score_cows.Caption:=INTTOSTR(cows);
      L_score_bulls.Caption:=INTTOSTR(bulls);
      IF fin then //Si la manche est termin�e, appel de la proc�dure Reboot
        Reboot;
      essais:=essais-1;
    END;
END;

function TForm1.VerifChaine(chaine:STRING):BOOLEAN;
//BUT:  V�rifier si une chaine est conforme (seulement des lettres minuscules, sans r�p�tition de la meme lettre)
//ENTREES:  Chaine de caract�res
//SORTIES:  Affichage messages si erreurs et retourne la valeur du test
VAR
  i,j:INTEGER;
  test:BOOLEAN;
BEGIN
  test:=FALSE;
  for i := 1 to length(chaine) do
    BEGIN
      if (chaine[i]<'a') OR (chaine[i]>'z') then
        BEGIN
        test:=TRUE;
        END;
    END;
  if test=FALSE then
    BEGIN
      for i := 1 to length(chaine) do
        BEGIN
          for j := 1 to length(chaine) do
            BEGIN
              if ((chaine[i]=chaine[j]) AND (j<>i)) then
              BEGIN
                test:=TRUE;
              END;
            END;
        END;
      if test then
          showmessage('Interdiction de mettre deux fois la m�me lettre');
    END
  ELSE
      showmessage('Seulement des caract�res minuscules');
  VerifChaine:=test;
END;

FUNCTION TForm1.VerifChaineTaille(chaine,chaine2:STRING):BOOLEAN;
//BUT:  V�rifier si deux chaines ont la m�me longueur
//ENTREES:  2 Chaines de caract�res
//SORTIES:  Retourne la valeur du test
VAR
  test:BOOLEAN;
BEGIN
  test:=FALSE;
  if chaine.length<>chaine2.Length then
    BEGIN
      test:=TRUE;
      showmessage('La taille n''est pas la m�me que celle du mot');
    END;
  VerifChaineTaille:=test;
END;

procedure TForm1.B_QuitterClick(Sender: TObject);
//BUT:  Appeler la proc�dure de stockage du score et fermeture de l'application
//ENTREES:  Click utilisateur
//SORTIES:  Appel proc�dure scoring
begin
Scoring;
close;
end;

procedure TForm1.Scoring;
//BUT:  Stocker le score effectu� et �craser le pr�c�dent
//ENTREES:  Ouverture fichier score
//SORTIES:  Stockage score
BEGIN
  REWRITE(F);
  write(F,score);
  CLOSEFile(F);
END;

PROCEDURE TForm1.Cow(chaine,chaine2:STRING);
//BUT:  Incr�menter une variable si deux caract�res de deux chaines sont au m�me emplacement, sinon appel de la proc�dure bull
//ENTREES:  2 Chaines de caract�res
//SORTIES:  Incr�mentation cows ou appel de Bull
VAR
  i:INTEGER;
BEGIN
  for i := 1 to length(chaine2) do
    BEGIN
      if chaine[i]=chaine2[i] then
        cows:=cows+1
      ELSE
        Bull(chaine[i],chaine2);
    END;
END;

PROCEDURE TForm1.Bull(car:CHAR ; chaine2:STRING);
//BUT:  Incr�menter une variable si un caract�re sp�cifique est �gal � celui d'une seconde chaine
//ENTREES:  1 Chaines de caract�res, caract�re � v�rifier
//SORTIES:  Incr�mentation bulls
VAR
  i:INTEGER;
BEGIN
  for i := 1 to length(chaine2) do
    BEGIN
      if car=chaine2[i] then
        bulls:=bulls+1;
    END;
END;

FUNCTION TForm1.fin:BOOLEAN;
//BUT:  D�finir la victoire ou la d�faite de l'utilisateur
//ENTREES:  Test de la variable cows et essais
//SORTIES:  Assignation des variables Defaite ou Victoire + incr�mentation du score et assignation des labels
BEGIN
  if cows=length(mot) then
    BEGIN
      Victoire:=TRUE;
      L_fin.Caption:='VICTOIRE';
      score:=score+1;
      L_score.Caption:=INTTOSTR(score);
    END
  ELSE
    if essais-1=0 then
      BEGIN
        Defaite:=TRUE;
        L_fin.Caption:='DEFAITE';
      END;
  fin:=(Defaite OR Victoire)
END;

procedure TForm1.Reboot;
//BUT:  R�initialiser les variables et les �tats pour permettre le lancement d'une nouvelle manche
//ENTREES:  Variables victoire et d�faite, last_mot
//SORTIES:  Assignation des �tats et variables
BEGIN
  L_fin.Visible:=TRUE;
  Victoire:=FALSE;
  Defaite:=FALSE;
  last_mot:=mot;
  B_GO.Visible:=TRUE;
  B_Tester.Visible:=FALSE;
END;

end.
