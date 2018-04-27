#include "define.h"

//void RenderRect (Game *myGame, SDL_Rect *rect, RawPoint position);


//NOTE : Le programme fonctionne mais il existe bel et bien une redondance lors de l'inclusion du fichier header de la SDL

int main(int argc, char *argv[])
{
        //Initialization
        Game myGame;
        InEvent eventHandler;
        unsigned int frameLimit;

        if (!Init("Chapter 1 Setting up SDL", SDL_WINDOWPOS_CENTERED,SDL_WINDOWPOS_CENTERED,SCREEN_WIDTH,SCREEN_HEIGHT,SDL_WINDOW_SHOWN,&myGame))
        {
                myGame.g_State.g_bRunning = MIN1;

                myGame.g_pTexture = SDL_CreateTexture(myGame.g_pRenderer, SDL_PIXELFORMAT_ABGR8888, SDL_TEXTUREACCESS_STREAMING,SCREEN_WIDTH,SCREEN_HEIGHT);

                while(myGame.g_State.g_bRunning)
                {
                    switch(handleEvents(&myGame.g_State))
                    {
                        case key_up:
                            break;
                        case key_down:
                            break;
                        default:
                            break;
                    }
                    SDL_DestroyTexture(myGame.g_pTexture);
                    SDL_RenderPresent(myGame.g_pRenderer); //Refresh Screen
                    SDL_RenderClear(myGame.g_pRenderer);


                    Delay(frameLimit);
                    frameLimit = SDL_GetTicks() + MAXIMAGEPS;  //1/60(FPS) * 1000 = 16.6
                }

                SDL_DestroyWindow(myGame.g_pWindow);

                Destroy(&myGame);

                return EXIT_SUCCESS;

        }else{
                return EXIT_FAILURE;
        }

        SDL_Quit();
}



/*
void RenderRect (Game *myGame, SDL_Rect *rect, RawPoint position)
{
    SetRectSizeRough(rect, 50, 100);
    MoveRectToRawPoint(rect, position);

    SDL_SetRenderDrawColor(myGame->g_pRenderer, 255, 0, 0, 255);
    SDL_SetRenderTarget(myGame->g_pRenderer, myGame->g_pTexture);
    SDL_RenderFillRect(myGame->g_pRenderer, rect);

    SDL_SetRenderTarget(myGame->g_pRenderer, NULL);
    SDL_SetRenderDrawColor(myGame->g_pRenderer, 0, 0, 0, 255);
}
*/
