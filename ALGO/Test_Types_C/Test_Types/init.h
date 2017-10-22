
#ifndef DEF_INIT
#define DEF_INIT
#include <stdio.h>
#include <stdlib.h>
#define MAX_NOM 21
#define MAX_ADRESSE 31
#define MAX_MEMBRES 8
#define UNASSIGNED_VALUE "Unassigned"

    typedef struct personne personne;
    struct personne
    {
        char nom[MAX_NOM], prenom[MAX_NOM];
        char adresse[MAX_ADRESSE], mail[MAX_ADRESSE];
        int age, sexe, poids, taille;
    };

    typedef struct groupe groupe;
    struct groupe
    {
        int nbMembres;
        char name[MAX_NOM];
        personne membre[MAX_MEMBRES];
    };

    void InitIndividu(personne *individu);
    void InitEquipe(groupe *equipe);
    void InitChaine(char *chaine);

#endif // DEF_INIT
