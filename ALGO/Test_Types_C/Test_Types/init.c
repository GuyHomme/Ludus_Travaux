#include "init.h"

void InitChaine(char chaine[])    //Passer un tableau en paramètre le passe automatiquement par référence ?
{
    chaine[0] = 'U';
    chaine[1] = 'n';
    chaine[2] = 'a';
    chaine[3] = 's';
    chaine[4] = 's';
    chaine[5] = 'i';
    chaine[6] = 'g';
    chaine[7] = 'n';
    chaine[8] = 'e';
    chaine[9] = 'd';
}

void InitEquipe(groupe *equipe) //Initialiser les champs d'une variable de type "groupe" avec appel de la fonction InitIndividu
{
    InitChaine(equipe->name);
    equipe->nbMembres = 0;

    int i = 0;
    for(i = 0 ; i < MAX_MEMBRES ; i++)
    {
        InitIndividu(&equipe->membre[i]);
    }
}

void InitIndividu(personne *individu)   //Initialiser les champs d'une variable de type "personne"
{
    InitChaine(individu->nom);
    InitChaine(individu->prenom);
    individu->age = 0;
    individu->poids = 0;
    individu->taille = 0;
    InitChaine(individu->adresse);
    InitChaine(individu->mail);
    individu->sexe = 0;
}
