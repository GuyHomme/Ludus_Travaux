#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define SIZE_NAME 20
#define SIZE_CITY 15
#define MAX_LINE 125

#define TRUE 1
#define FALSE 0

typedef enum tSex
{
    MALE, FEMALE
}tSex;

typedef struct date
{
    int d;
    int m;
    int y;
}date;

typedef struct IDCard
{
    int nbCard;
    char name[SIZE_NAME];
    char firstName[SIZE_NAME];
    tSex sex;
    date birthDate;
    char city[SIZE_CITY];
}IDCard;

//CONSTRUCTORS
IDCard CreateCardThroughInput();
date CreateDateThroughInput();

//DISPLAY
void PrintIDCard(IDCard card);

//TESTS
int EqualStrings(char string1[], char string2[3], int size);

int main()
{
    IDCard testCard = CreateCardThroughInput();
    IDCard newCard;
    char* line;

    FILE* storageFileText = fopen("IdentityCards.txt", "a");
    FILE* storageFileBin;
    /*
        FILE* est un descripteur de fichier (stocké sur un support amovible de stockage)

    */

    //TEXT OPERATIONS
    if(storageFileText != NULL)
    {
        printf("Text file found, trying to write within\n");
        fprintf(storageFileText, "%d %s %s %d %s %d/%d/%d\n", testCard.nbCard, testCard.name, testCard.firstName, testCard.sex, testCard.city, testCard.birthDate.d, testCard.birthDate.m, testCard.birthDate.y);
        fclose(storageFileText);
        printf("Successfully wrote within IdentityCards.txt\n");
    }else
    {
        printf("Error while trying to open the text file IdentityCards.txt\n Creating the file instead");
    }

    printf("Trying to read from IdentityCards.txt\n");

    //READ FROM TEXT
    storageFileText = fopen("IdentityCards.txt", "r");

    if(storageFileText != NULL)
    {
        line = (char*) malloc(sizeof(char) * MAX_LINE);

        if(line != NULL)
        {
            printf("Content of IdentityCards.txt : \n");
            do
            {
                line = fgets(line, sizeof(char) * MAX_LINE, storageFileText);
                if(line != NULL)
                    printf("\n%s\n", line);
            }while(feof(storageFileText) == 0);
            free(line);
        }else
        {
            printf("Error while trying to allocate memory to read the file");
        }
    }else
    {
        printf("Can't access to IdentityCards.txt");
    }

    fflush(stdin);

    //BINARY OPERATIONS
    storageFileBin = fopen("IdentityCards.bin", "ab");

    if(storageFileBin != NULL)
    {
        printf("Bin file found, trying to write within\n");
        fwrite(&testCard, sizeof(IDCard), 1, storageFileBin);
        printf("Successfully wrote within IdentityCards.bin\n");
        fclose(storageFileBin);
    }else
    {
        printf("Error while trying to open the bin file IdentityCards.bin\n Creating the file instead");
    }

    printf("Trying to read from IdentityCards.bin file\n");

    //READ FROM BIN
    storageFileBin = fopen("IdentityCards.bin", "rb");
    if(storageFileBin != NULL)
    {
        printf("Content of IdentityCards.bin :\n");
        do
        {
            fread(&newCard, sizeof(newCard), 1, storageFileBin);
            if(feof(storageFileBin) == 0)
                PrintIDCard(newCard);
        }while(feof(storageFileBin) == 0);
        //fread(&newCard, sizeof(newCard), 1, storageFileBin);
        fclose(storageFileBin);
    }else
    {
        printf("Can't access to IdentityCards.bin");
    }

    return EXIT_SUCCESS;
}

//Setters

IDCard CreateCardThroughInput()
{
    //Returns an IDCard structure that is initialized by the user

    IDCard storageCard;

    printf("Enter your number of card\n");
    scanf("%d", &storageCard.nbCard);
    printf("Enter your name\n");
    scanf("%s", storageCard.name);
    printf("Enter your first name\n");
    scanf("%s", storageCard.firstName);
    printf("Enter your sex (0 or 1)\n");
    scanf("%d", (int)(&storageCard.sex));
    printf("Enter your birth date :\n");
    storageCard.birthDate = CreateDateThroughInput();
    printf("Enter your city :\n");
    scanf("%s", storageCard.city);

    return storageCard;
}

date CreateDateThroughInput()
{
    //Return a date structure that is initialized by the user

    date storageDate;

    printf("Day :\n");
    scanf("%d", &storageDate.d);
    printf("Month :\n");
    scanf("%d", &storageDate.m);
    printf("Year :\n");
    scanf("%d", &storageDate.y);

    return storageDate;
}

//DISPLAY

void PrintIDCard(IDCard card)
{
    //Displays an IDCard structure with "printf" function

    printf("\n\n%d %s %s %d %s %d/%d/%d\n", card.nbCard, card.name, card.firstName, card.sex, card.city, card.birthDate.d, card.birthDate.m, card.birthDate.y);
}

