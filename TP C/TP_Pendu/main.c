/*
ALGO PENDU

CONST
    NB_ESSAI = 6
    LONGUEUR_DESSIN = 7
    LARGEUR_DESSIN = 6
    TAILLE_MAX_MOT = 20
    TAILLE_ALPHABET = 26

    COORD_TETE_X = 5
    COORD_TETE_Y = 3

TYPE
    tabBool = TABLEAU[1..TAILLE_MAX_MOT] DE booleen
    tabAlphabet = TABLEAU[1..TAILLE_ALPHABET] DE caractere

procedure RemplissageLettresUtilisees(var lettresUtilisees : tabAlphabet, lettreEntree : caractere)
//Vérifie dans un premier temps que lettreEntree n'existe pas déjà dans lettresUtilisees, dans ce cas lattreEntree est ajoutée à lettresUtilisees
    var
        i : entier
        lettreDejaUtilisee : booleen
DEBUT
    i <- 1
    TANT QUE (lettresUtilisees[i] <> DernierCaractere) FAIRE    //On assume que DernierCaractere est le dernier caractere de lettresUtilisees
    DEBUT
        SI (lettreEntree = lettresUtilisees[i]) lettreDejaUtilisee <- VRAI
        i <- i+1
    FINTANTQUE
        SI(lettreDejaUtilisee) lettresUtilisees[i] <- lettreEntree
FIN

procedure AffichagePendu(essaisRestants : entier)    //Affiche le dessin du pendu en fonction de essaisRestants.
    var
        i : entier
DEBUT
    POUR(i DE 1 A LONGUEUR_DESSIN) FAIRE
        POUR(j DE 1 A LARGEUR_DESSIN) FAIRE
            SI((i = 1 ET j < LARGEUR_DESSIN) OU j=1 OU (i = 2 ET j = LARGEUR_DESSIN-2))ALORS
                ECRIRE("*")
            SINON
                SI(essaisRestants <> NB_ESSAI)ALORS
                    SI(essaisRestants <= NB_ESSAI-1 ET i = COORD_TETE_Y ET j = COORD_TETE_X)ALORS
                        ECRIRE("O")
                    FINSI
                    SI(essaisRestants <= NB_ESSAI-2 ET i = COORD_TETE_Y+1 ET j = COORD_TETE_X)ALORS
                        ECRIRE("|")
                    FINSI
                    SI(essaisRestants <= NB_ESSAI-3 ET i = COORD_TETE_Y+1 ET j = COORD_TETE_X-1)ALORS
                        ECRIRE("/")
                    FINSI
                    SI(essaisRestants <= NB_ESSAI-4 ET i = COORD_TETE_Y+1 ET j = COORD_TETE_X+1)ALORS
                        ECRIRE("\")
                    FINSI
                    SI(essaisRestants <= NB_ESSAI-5 ET i = COORD_TETE_Y+2 ET j = COORD_TETE_X-1)ALORS
                        ECRIRE("/")
                    FINSI
                    SI(essaisRestants = NB_ESSAI-6 ET i = COORD_TETE_Y+2 ET j = COORD_TETE_X+1)ALORS
                        ECRIRE("\")
                    FINSI
                SINON
                    ECRIRE(" ")
                FIN SI
            FIN SI
        FINPOUR
    FINPOUR
FIN


fonction AffichageCombi(combiTabBool : tabBool, mot : chaine) : booleen

//Affiche les caracteres trouvés dans la chaine mot en fonction des données de combiTabBool et retourne VRAI si tous les caractères ont été trouvés

    var
        i : entier
        test : booleen
DEBUT
    test <- VRAI
    i <- 0
    POUR(i DE 1 A taille(mot)) FAIRE   //On suppose qu'il existe une fonction déterminant la taille de la chaine représentant le mot entré par l'utilisateur à l'intérieur de "mot"
        SI(combiTabBool[i]) ALORS
            ECRIRE(mot[i])
        SINON
            test <- FAUX
            ECRIRE("*")
        FINSI
    FINPOUR
    AffichageCombi <- test
FIN


procedure LireMot(var mot) //Lire l'entrée de l'utilisateur et l'assigner à l'argument mot
DEBUT
    ECRIRE("Entrez le mot à deviner")
    LIRE(mot)
        SI(mot = "") ALORS
            LireMot(mot)
FIN


procedure InitTabBool(var combiTabBool : tabBool)   //Initialise le tableau de booléens combiTabBool en argument à FAUX
    var
        i : entier
DEBUT
    POUR(i DE 1 A TAILLE_MAX_MOT)
        combiTabBool[i] <- FAUX
    FINPOUR
FIN


fonction LettreTrouvee(lettre : caractere, mot : chaine, var combiTabBool : tabBool) : booleen

//Retourne VRAI si lettre a bien été trouvée dans mot et assigne les booléens correspondants de combiTabBool à VRAI

    var
        i : entier
        test : booleen
DEBUT
    test <- FAUX
    POUR(i DE 1 A taille(mot)) FAIRE //On suppose qu'il existe une fonction déterminant la taille de la chaine représentant le mot entré par l'utilisateur à l'intérieur de "mot"
        SI(mot[i] = lettre) ALORS
            test <- VRAI
            combiTabBool[i] <- VRAI
        FINSI
    FINPOUR
    LettreTrouvee <- test
FIN

    var
        essais : entier
        mot : chaine
        lettre : caractere
        victoire : booleen
        combiTabBool : tabBool
        lettresUtilisees : tabAlphabet

DEBUT
    victoire <- FAUX
    essais <- NB_ESSAI

    LireMot(mot)
    MAJ(mot)    //Fonction de mise en majuscule
    InitTabBool(combiTabBool)
        REPETER
            //Effacer écran
            ECRIRE("Entrez une lettre")
            LIRE(lettre)
            RemplissageLettresUtilisees(lettresUtilisees, lettre)
            MAJ(lettre) //Fonction de mise en majuscule
                SI(PAS(LettreTrouvee(lettre,mot,combiTabBool) ALORS
                    essais <- essais - 1
                SI(AffichageCombi(combiTabBool,mot))ALORS
                    victoire <- VRAI
                    ECRIRE("Bravo, le mot était bien : " & mot)
                SINON
                    ECRIRE("Lettres utilisées : " & lettresUtilisees
                    AffichagePendu(essais)
                        SI(essais = 0) ALORS ECRIRE("Dommage, le mot était : " & mot)
        JUSQU'A(victoire OU essais = 0)
FIN.
*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>


#define TAILLE_MAX_MOT 20
#define NB_ESSAIS 6
#define LARGEUR_DESSIN 6
#define LONGUEUR_DESSIN 7

#define COORD_TETE_X 4
#define COORD_TETE_Y 3

#define TAILLE_ALPHABET 26 //Taille pour le tableau de caractères déjà entrés par l'utilisateur

#define TRUE 1  //Pour lisibilité des variables utilisées comme booléens
#define FALSE 0

void InitTabBool(int combiTabBool[]);
void AffichagePendu(int essais);
int AffichageCombi(int combiTabBool[], char mot[], int tailleMot);
void LireMot(char mot[]);
void InitTabBool(int combiTabBool[]);
int LettreTrouvee(char lettre, char mot[], int combiTabBool[], int tailleMot);
void ViderBuffer();
int ChaineErronee(char mot[]);
void ChaineMAJ(char mot[]);
void RemplissageLettresUtilisees(char lettresUtilisees[], char lettreEntree);

int main()
{
    int taille = 0, essais = NB_ESSAIS, victoire = FALSE;
    int combiTabBool[TAILLE_MAX_MOT];
    char mot[TAILLE_MAX_MOT], lettresEntrees[TAILLE_ALPHABET] = {'\0'};
    char lettre = 0;

    LireMot(mot);
    InitTabBool(combiTabBool);
    while(mot[taille] != '\0') taille++; //Obtention de la taille de la chaine (entrée dans le tableau de char)
        do
        {
            printf("Entrez une lettre\n");
            scanf("%c", &lettre);
            lettre = toupper(lettre);   //Tous les caractères sont rendus en majuscule (mot à deviner et caractères entrés)
            RemplissageLettresUtilisees(lettresEntrees,lettre);
            while(getchar()!='\n');
                if(!LettreTrouvee(lettre, mot, combiTabBool, taille))essais --;
                //Si la lettre entrée ne figure pas parmi celles du mot, le nombre d'essais diminue
                if(AffichageCombi(combiTabBool, mot, taille))
                {
                    printf("Bravo, le mot était bien : %s\n", mot);
                    victoire = TRUE;
                }
                else
                {
                    printf("Lettres déjà utilisées %s\n", lettresEntrees);
                    AffichagePendu(essais);
                    if(!essais) printf("Dommage, le mot était : %s\n", mot);
                }
        }while(!victoire && essais > 0);

    return EXIT_SUCCESS;
}

void InitTabBool(int combiTabBool[])
//Initialise le tableau de booléens combiTabBool en argument à FALSE
{
    int i = 0;

    for(i = 0 ; i < TAILLE_MAX_MOT ; i++)
    {
        combiTabBool[i] = FALSE;
    }
}

void LireMot(char mot[])
//Lire l'entrée de l'utilisateur et l'assigner à l'argument mot
{
    printf("Entrez le mot a deviner\n");
    gets(mot);
    ChaineMAJ(mot);
        if(mot[0] == '\0' || ChaineErronee(mot)) //Si l'utilisateur n'a rien entré ou que la chaine n'est pas valide, la fonction se relance
            LireMot(mot);
}


int LettreTrouvee(char lettre, char mot[], int combiTabBool[], int tailleMot)
//Retourne TRUE si lettre a bien été trouvée dans mot et assigne les booléens correspondants de combiTabBool à TRUE
{
    int i = 0, test = FALSE;

    for(i = 0 ; i < tailleMot ; i++)
    {
        if(mot[i] == lettre)
        {
            test = TRUE;
            combiTabBool[i] = TRUE;
        }
    }
    return test;
}

void AffichagePendu(int essais)
//Affiche le dessin du pendu en fonction de essais
{
    int i = 0, j = 0;

    for(i = 0 ; i < LONGUEUR_DESSIN ; i++)
    {
        for(j = 0 ; j < LARGEUR_DESSIN ; j++)
        {
            if((!i && j < LARGEUR_DESSIN-1) || !j || (i == 1 && j == LARGEUR_DESSIN-3))
                printf(" * ");
            else
            {
                if(essais != NB_ESSAIS)
                {
                    if(essais <= NB_ESSAIS-1 && i == COORD_TETE_Y-1 && j == COORD_TETE_X-1)
                        printf(" O ");
                    if(essais <= NB_ESSAIS-2 && i == COORD_TETE_Y && j == COORD_TETE_X-1)
                        printf("|");
                    if(essais <= NB_ESSAIS-3 && i == COORD_TETE_Y && j == COORD_TETE_X-2)
                        printf("/");
                    if(essais <= NB_ESSAIS-4 && i == COORD_TETE_Y && j == COORD_TETE_X)
                        printf("\\");
                    if(essais <= NB_ESSAIS-5 && i == COORD_TETE_Y+1 && j == COORD_TETE_X-2)
                        printf("/");
                    if(essais == NB_ESSAIS-6 && i == COORD_TETE_Y+1 && j == COORD_TETE_X)
                        printf(" \\");
                }
                else
                {
                    printf("  ");
                }
            }
        }
        printf("\n");
    }
    printf("\n");
}

void RemplissageLettresUtilisees(char lettresUtilisees[], char lettreEntree)
//Vérifie dans un premier temps que lettreEntree n'existe pas déjà dans lettresUtilisees, dans ce cas lattreEntree est ajoutée à lettresUtilisees
{
    int i = 0, lettreDejaUtilisee = FALSE;

    while(lettresUtilisees[i] != '\0')
    {
        if(lettreEntree == lettresUtilisees[i]) lettreDejaUtilisee = TRUE;
        i++;
    }
        if(!lettreDejaUtilisee)
        {
            lettresUtilisees[i] = lettreEntree;
            lettresUtilisees[i+1] = '\0';
        }
}

int AffichageCombi(int combiTabBool[], char mot[], int tailleMot)
//Affiche les caracteres trouvés dans la chaine mot en fonction des données de combiTabBool et retourne VRAI si tous les caractères ont été trouvés
{
    int i = 0, test = TRUE;

    for(i = 0 ; i < tailleMot ; i++)
    {
        if(combiTabBool[i])
            printf("%c", mot[i]);
        else
        {
            printf("*");
            test = FALSE;
        }
    }
    printf("\n");

    return test;
}

int ChaineErronee(char mot[])
//Vérifie que mot ne contient que des lettres et retourne le résultat de ce test
{
    int i = 0, test = FALSE;

    for(i = 0 ; mot[i] != '\0' ; i++)
    {
        if(!isalpha(mot[i]))
            test = TRUE;
    }
    return test;
}

void ChaineMAJ(char mot[])
//Convertir l'intégralité des caractères de mot en majuscule
{
    int i = 0;

    for(i = 0 ; mot[i] != '\0' ; i++)
    {
        mot[i] = toupper(mot[i]);
    }
}

void ViderBuffer()
//Vider le buffer avec getchar()
{
    while(getchar() != '\0');
}



