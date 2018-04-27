#ifndef DEF_TRANSFORM

#define DEF_TRANSFORM

#include <SDL2\SDL.h>
//Ici est �galement inclu le fichier header de la SDL, mais ceci cr�e une redondance par rapport � la premi�re inclusion du m�me fichier par game.h

typedef struct RawPoint
{
    int m_x;
    int m_y;
}RawPoint;

typedef struct Point
{
    float m_x;
    float m_y;
}Point;

void SetRawPointInt(RawPoint* targetPoint, int x, int y);
void SetRectSize(SDL_Rect *targetRect, RawPoint rectSize);
void SetRectSizeRough(SDL_Rect *targetRect, int width, int height);

void MoveRectToRawPoint(SDL_Rect *targetRect, RawPoint position);
void MoveRectToCoords(SDL_Rect *targetRect, int targetX, int targetY);

RawPoint GetRectCenterPosition(SDL_Rect targetRect);
RawPoint GetRectRoughPosition(SDL_Rect targetRect);

RawPoint TranslateVector2D(RawPoint point1, RawPoint point2);

#endif // DEF_TRANSFORM
