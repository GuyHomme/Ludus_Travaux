#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "read.h"
#include "init.h"



void AfficheIndividu(personne individu);
void ViderBuffer();

int main()
{
    groupe equipe;

    InitEquipe(&equipe);
    printf("Entrez le nom de votre équipe\n");
    fgets(&equipe.name, MAX_NOM, stdin);
    printf("Entrez le nombre de membres dans votre équipe\n");
    scanf("%d", &equipe.nbMembres);                //Utiliser scanf est propre ? Débordement overflow et buffer avec "enter" et "espace"
    ViderBuffer();
    LireEquipe(&equipe);
    int cmdUser = 0;
    do
    {
        printf("Choisissez un membre à afficher de %d à %d\n", 1, equipe.nbMembres);
        printf("Appuyez sur 0 pour quitter\n");
        scanf("%d", &cmdUser);
        printf("Membre de l'equipe %s\n", equipe.name);
        AfficheIndividu(equipe.membre[cmdUser-1]);
    }while(cmdUser != 0);

    return EXIT_SUCCESS;
}

void ViderBuffer()
{
    char c = 0;

    while(c != '\n' && c != EOF)
    {
        c = getchar();
    }
}




void AfficheIndividu(personne individu) //Afficher les champs d'une variable de type "personne"
{
    printf("%s %s\n", individu.nom, individu.prenom);
    if(individu.sexe)
        printf("Homme\n");
    else printf("Femme\n");
    printf("%d ans\n", individu.age);
    printf("%d cm %d kg\n", individu.taille, individu.poids);
    printf("%s\n", individu.mail);
    printf("Adresse : %s\n", individu.adresse);
}
