#include "transform.h"

void SetRawPointInt(RawPoint* targetPoint, int x, int y)
{
    targetPoint->m_x = x;
    targetPoint->m_y = y;
}

void SetRectSize(SDL_Rect *targetRect, RawPoint rectSize)
{
    targetRect->w = rectSize.m_x;
    targetRect->h = rectSize.m_y;
}
void SetRectSizeRough(SDL_Rect *targetRect, int width, int height)
{
    targetRect->w = width;
    targetRect->h = height;
}

void MoveRectToRawPoint(SDL_Rect *targetRect, RawPoint position)
{
    targetRect->x = position.m_x;
    targetRect->y = position.m_y;
}

void MoveRectToCoords(SDL_Rect *targetRect, int targetX, int targetY)
{
    targetRect->x = targetX;
    targetRect->y = targetY;
}

RawPoint GetRectCenterPosition(SDL_Rect targetRect)
{
    RawPoint tempPoint = {targetRect.w + targetRect.x, targetRect.h + targetRect.y};

    return(tempPoint);
}

RawPoint GetRectRoughPosition(SDL_Rect targetRect)
{
    RawPoint tempPoint = {targetRect.x, targetRect.y};

    return tempPoint;
}

RawPoint TranslateVector2D(RawPoint point1, RawPoint point2)
{
    RawPoint tempPoint = {point1.m_x + point2.m_x, point1.m_y + point2.m_y};

    return tempPoint;
}
