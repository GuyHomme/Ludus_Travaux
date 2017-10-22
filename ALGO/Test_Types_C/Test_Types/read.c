#include "read.h"

void LireMembre(personne *individu)//Assigne les valeurs des champs d'une variable de type "personne" avec entrées de l'utilisateur
{
    printf("Nom :\n");
    fgets(&individu->nom, MAX_NOM, stdin);  //Pour pointer l'adresse de l'attribut d'un struct il faut forcément passer par &nom->attribut1 ?
    printf("Prenom :\n");
    fgets(&individu->prenom, MAX_NOM, stdin);
    printf("Age :\n");
    scanf("%d", &individu->age);
    printf("Sexe (1 = Homme, 0 = Femme):\n");
    scanf("%d", &individu->sexe);
    printf("Taille cm:\n");
    scanf("%d", &individu->taille);
    printf("Poids kg:\n");
    scanf("%d", &individu->poids);
    ViderBuffer();
    printf("Mail :\n");
    fgets(&individu->mail, MAX_ADRESSE, stdin);
    printf("Adresse :\n");
    fgets(&individu->adresse, MAX_ADRESSE, stdin);
}

void LireEquipe(groupe *equipe) //Assigne les valeurs des champs d'une variable de type "groupe" en appelant la fonction LireMembre
{
    int i = 0;

    for(i = 0 ; i < equipe->nbMembres ; i++)
    {
        printf("Membre N°%d\n", i+1);
        LireMembre(&equipe->membre[i]);
    }
}
