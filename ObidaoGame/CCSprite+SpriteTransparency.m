//
//  CCSprite+SpriteTransparency.m
//  Obidao
//
//  Created by work on 12/9/13.
//  Copyright (c) 2013 OriginateChina. All rights reserved.
//


#import "CCSprite+SpriteTransparency.h"
#import "Defaults.h"
#import "ScreenScaleFactor.h"
@implementation SKSpriteNode (SpriteTransparency)


+ (BOOL)containsTouchLocation:(CGPoint)location veggieType:(VeggieType)veggieType {
  CGRect rect ;
  
  switch (veggieType) {
    case VeggieTomato:
      rect  = CGRectMake(WINSIZE_WIDTH - WINSIZE_WIDTH *0.75 , 0 ,WINSIZE_WIDTH * 0.5,WINSIZE_HEIGHT * 0.6 );
      break;
    case VeggieCarot:
      rect  = CGRectMake(WINSIZE_WIDTH - WINSIZE_WIDTH *0.65 , 0 ,WINSIZE_WIDTH * 0.3,WINSIZE_HEIGHT);
      break;
    case VeggieOnion:
      rect  = CGRectMake(WINSIZE_WIDTH - WINSIZE_WIDTH *0.75 , 0 ,WINSIZE_WIDTH * 0.5,WINSIZE_HEIGHT * 0.8 );
      break;
    case VeggieRadish:
      rect  = CGRectMake(WINSIZE_WIDTH - WINSIZE_WIDTH * 0.9 , WINSIZE_HEIGHT * 0.2 ,WINSIZE_WIDTH * 0.6,WINSIZE_HEIGHT * 0.6 );
      break;
    case VeggieEggplant:
      rect  = CGRectMake(WINSIZE_WIDTH - WINSIZE_WIDTH *0.75 , 0 ,WINSIZE_WIDTH * 0.5,WINSIZE_HEIGHT * 0.8 );
      break;
    case VeggieCucumber:
    case VeggiePotato:
    default:
      return FALSE;
  }
  return CGRectContainsPoint(rect, location);
}


@end
