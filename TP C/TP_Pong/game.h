#ifndef DEF_GAME

#define DEF_GAME

#include <SDL2\SDL.h> //Ici est inclu le fichier header de la SDL
#include <stdio.h>
#include <stdlib.h>

#define SCREEN_WIDTH 1024
#define SCREEN_HEIGHT 780
#define MIN0 0
#define MIN1 1
#define MAXIMAGEPS 16   //1/60(FPS) * 1000 = 16.6

typedef struct GameState
{
        int g_bRunning;
}GameState;

typedef struct Game
{
        SDL_Window *g_pWindow;
        SDL_Renderer *g_pRenderer;
        SDL_Texture *g_pTexture;
        GameState g_State;
}Game;

typedef enum InEvent
{
    key_up, key_down, no_event
}InEvent;

extern int Init(char *title, int xpos, int ypos, int width, int height, int flags, Game *myGame);
extern void Destroy(Game *myGame);
extern void Delay(unsigned int frameLimit);
extern InEvent handleEvents(GameState *state);

#endif // DEF_GAME
