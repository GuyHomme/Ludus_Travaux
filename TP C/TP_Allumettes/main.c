/*

ALGO Allumettes

CONST
    NB_ALLUMETTE = 21
    PIOCHE_DEFAUT = 3
    NB_JOUEUR = 2

fonction Pioche(reste: ENTIER) : ENTIER
    VAR
        piocheMax, piocheUser : ENTIER
    DEBUT
        piocheUser <- 0
        piocheMax <- 0
            SI reste < PIOCHE_DEFAUT ALORS
                piocheMax <- reste
            SINON
                piocheMax <- PIOCHE_DEFAUT
        ECRIRE("Jusqu'à " & piocheMax & " allumette(s)")
        LIRE(piocheUser)											//L'utilisateur rentre le nombre d'allumettes qu'il veut retirer
            SI piocheUser > piocheMax OU piocheUser < 1 ALORS Pioche(reste)
            SINON Pioche <- piocheUser
    FIN

FONCTION PiocheAuto (reste :ENTIER) : ENTIER
    VAR
        piocheMax, piocheComputer: ENTIER
    DEBUT
            SI reste < PIOCHE_DEFAUT ALORS
                piocheMax <- reste
            SINON
                piocheMax <- PIOCHE_DEFAUT
            FIN SI
        piocheComputer <-ALEATOIRE (piocheMax)
        ECRIRE("Le joueur 2 décide de prendre " & piocheComputer & " allumettes")
    FIN

fonction Victoire (reste: ENTIER) : BOOLEEN
    DEBUT
        SI reste=0 ALORS				//S'il ne reste plus d'allumettes alors, la fonction retourne VRAI
            Victoire<-VRAI
        SINON
            Victoire<-FAUX
    FIN

procedure LireCommande(var commande:ENTIER)
    DEBUT
        ECRIRE("Entrez :")
		ECRIRE("1 pour lancer une partie de deux joueurs")
		ECRIRE("2 pour lancer une partie individuelle")
		LIRE(commande)
            SI(commande <> 1 ET commande <> 2)ALORS
                LireCommande(commande)
    FIN.

VAR
    reste, commande: ENTIER

DEBUT
    reste <- NB_ALLUMETTE
    ECRIRE("Programme de jeu d'allumettes")
    REPETER
        reste <- NB_ALLUMETTE
        commande <- 0
        LireCommande(commande)
        CAS commande PARMI
            1:
                REPETER
                    ECRIRE("La main au joueur 1")
                    ECRIRE("Choisissez le nombre d'allumettes à retirer")
                    reste <- reste - Pioche()
                        SI(Victoire(reste))ALORS
                            ECRIRE("Le joueur 1 a perdu")
                        SINON
                            ECRIRE("La main au joueur 2")
                            ECRIRE("Choisissez le nombre d'allumettes à retirer")
                            reste <- reste - Pioche()
                                SI(Victoire(reste))ALORS
                                    ECRIRE("Le joueur 2 a perdu")
                        FINSI
                JUSQU'A(Victoire(reste))
            2:
                REPETER
                    ECRIRE("La main au joueur 1")
                    ECRIRE("Choisissez le nombre d'allumettes à retirer")
                    reste <- reste - Pioche
                        SI(Victoire(reste))ALORS
                            ECRIRE("Le joueur 1 a perdu")
                        SINON
                            ECRIRE("La main au joueur 2")
                            reste <- reste - PiocheAuto
                                SI(Victoire(reste))ALORS
                                    ECRIRE("Le joueur 2 a perdu")
                        FINSI
                JUSQU'A(Victoire(reste))
        FINCAS
        ECRIRE("Entrez 1 pour recommencer")
        LIRE(commande)
    JUSQU'A(commande <> 1)

FIN.


*/

#include <stdio.h>
#include <stdlib.h>
#define NB_ALLUMETTE 21
#define PIOCHE_DEFAUT 3
#define NB_JOUEUR 2

//TO DO : Implémenter la définition de piocheMax dans les fonctions "Pioche" dans le programme principal (évite de la définir deux fois)

void Affichage(int reste);
int Pioche(int reste);
int PiocheAuto(int reste);
int Victoire(int reste);
void LireCommande(int* commande);

int main()
{
    int reste = NB_ALLUMETTE, commande = 0;

    printf("Jeu des allumettes\n");
    do
    {
        reste = NB_ALLUMETTE;
        commande = 0;
        LireCommande(&commande);
        switch(commande)
        {
            case 1:
                    do
                    {
                        printf("La main au joueur 1, piochez\n");
                        reste -= Pioche(reste);
                        Affichage(reste);
                            if(Victoire(reste)) printf("Le joueur 1 perd\n");
                            else
                            {
                                printf("La main au joueur 2, piochez\n");
                                reste -= Pioche(reste);
                                Affichage(reste);
                                if(Victoire(reste)) printf("Le joueur 2 perd\n");
                            }
                    }while(!Victoire(reste));
                    break;
            case 2:
                    do
                    {
                        printf("La main au joueur 1, piochez\n");
                        reste -= Pioche(reste);
                        Affichage(reste);
                            if(Victoire(reste)) printf("Le joueur 1 perd\n");
                            else
                            {
                                printf("La main au joueur 2 \n");
                                reste -= PiocheAuto(reste);
                                Affichage(reste);
                                if(Victoire(reste)) printf("Le joueur 2 perd\n");
                            }
                    }while(!Victoire(reste));
                    break;
        }
    }while(commande == 1);

    return EXIT_SUCCESS;
}

void Affichage(int reste)
{
    int i = 0;
    if(!reste) printf("Aucune allumette");
    else
    {
        for(i = 0 ; i < reste ; i++) printf("|");
        printf("\n");
    }
}

int Pioche(int reste)
{
    int piocheMax = 0, piocheUser = 0;

    if(reste < PIOCHE_DEFAUT) piocheMax = reste;
    else piocheMax = PIOCHE_DEFAUT;
    printf("Jusqu'a %d allumettes \n", piocheMax);
    scanf("%d", &piocheUser);
        if(piocheUser > piocheMax || piocheUser < 1) Pioche(reste);
        else
            return piocheUser;
}

int PiocheAuto(int reste)

{
    int piocheMax = 0, piocheComputer = 0;

    if(reste < PIOCHE_DEFAUT) piocheMax = reste;
    else piocheMax = PIOCHE_DEFAUT;
    piocheComputer = rand() % piocheMax+1;
    printf("Le joueur 2 pioche %d allumettes\n", piocheComputer);

    return piocheComputer;
}

int Victoire(int reste)
{
    return(!reste);
}

void LireCommande(int* commande)
{
    printf("Entrez :\n 1 pour lancer une partie de deux joueurs \n 2 pour lancer une partie individuelle\n");
    scanf("%d", commande);
        if(*commande != 1 && *commande != 2) LireCommande(commande);
}
