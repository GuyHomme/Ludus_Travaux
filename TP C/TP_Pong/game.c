#include "game.h"

void Delay(unsigned int frameLimit)
{
        unsigned int ticks = SDL_GetTicks();

        if (frameLimit < ticks)
                return;

        if (frameLimit > ticks + MAXIMAGEPS)
                SDL_Delay(MAXIMAGEPS);
        else
                SDL_Delay(frameLimit - ticks);
}

int Init(char *title, int xpos, int ypos, int width, int height, int flags, Game *myGame)
{
        myGame->g_pRenderer=NULL;
        myGame->g_pTexture=NULL;
        myGame->g_pWindow=NULL;

        if (!SDL_Init(SDL_INIT_EVERYTHING)>= MIN0)
        {
                myGame->g_pWindow = SDL_CreateWindow(title,xpos,ypos,width,height,flags);

                if(myGame->g_pWindow!=NULL)
                        myGame->g_pRenderer=SDL_CreateRenderer(myGame->g_pWindow,-MIN1,SDL_RENDERER_ACCELERATED);
        }else
                return EXIT_FAILURE;


        SDL_RenderClear(myGame->g_pRenderer);
        SDL_RenderPresent(myGame->g_pRenderer);

        return EXIT_SUCCESS;
}

InEvent handleEvents(GameState *state)
{
    SDL_Event event;

    if(SDL_PollEvent(&event))
    {
        switch(event.type)
        {
            case SDL_QUIT:
                state->g_bRunning = MIN0;
                break;
            case SDL_KEYDOWN:
                switch(event.key.keysym.sym)
                {
                    case SDLK_ESCAPE:
                            state->g_bRunning = MIN0;
                            break;
                    case SDLK_UP:
                            return key_up;

                    case SDLK_DOWN:
                            return key_down;
                    default:
                        return no_event;
                }
                break;
            default:
                return no_event;
            }
    }else
        return no_event;
}

void Destroy(Game *myGame)
{
        if(myGame->g_pTexture!=NULL)
                SDL_DestroyTexture(myGame->g_pTexture);

        if(myGame->g_pRenderer!=NULL)
                SDL_DestroyRenderer(myGame->g_pRenderer);

        if(myGame->g_pWindow!=NULL)
                SDL_DestroyWindow(myGame->g_pWindow);
}
