//
//  Inhabitant.m
//  Obidao
//
//  Created by Sherlock on 6/17/13.
//  Copyright (c) 2013 OriginateChina. All rights reserved.
//

#import "Inhabitant.h"
#import "MathTool.h"
#import "CoordinateSystem.h"
#import "ImageNameString.h"
#import "ObidaoIsland.h"

@implementation Inhabitant

+ (SKSpriteNode *)createInbitants:(VeggieType)veggieType size:(CGSize)screenSize {
  
  switch (veggieType) {
    case VeggieTomato:
      return   [self showClosestInhabitant:[CoordinateSystem fixedPoint:CGPointMake(POINT_X_VEGGIE_TOMATO, POINT_Y_VEGGIE_TOMATO) withSize:screenSize]];
    case VeggieCarot:
      return  [self showClosestInhabitant:[CoordinateSystem fixedPoint:CGPointMake(POINT_X_VEGGIE_CAROT, POINT_Y_VEGGIE_CAROT) withSize:screenSize]];
    case VeggieOnion:
      return   [self showClosestInhabitant:[CoordinateSystem fixedPoint:CGPointMake(POINT_X_VEGGIE_ONION, POINT_Y_VEGGIE_ONION) withSize:screenSize]];
    case VeggieRadish:
      return   [self showClosestInhabitant:[CoordinateSystem fixedPoint:CGPointMake(POINT_X_VEGGIE_RADISH, POINT_Y_VEGGIE_RADISH) withSize:screenSize]];
    case VeggieEggplant:
      return  [self showClosestInhabitant:[CoordinateSystem fixedPoint:CGPointMake(POINT_X_VEGGIE_EGGPLANT, POINT_Y_VEGGIE_EGGPLANT) withSize:screenSize]];
    case VeggieCucumber:
      //  return   [self showClosestInhabitant:[CoordinateSystem fixedPoint:CGPointMake(POINT_X_VEGGIE_CUCUMBER, POINT_Y_VEGGIE_CUCUMBER) withSize:screenSize]];
    case VeggiePotato:
      return  [self showClosestInhabitant:[CoordinateSystem fixedPoint:CGPointMake(POINT_X_VEGGIE_POTATO, POINT_Y_VEGGIE_POTATO) withSize:screenSize]];
    case VeggieCorn:
      // return   [self showClosestInhabitant:[CoordinateSystem fixedPoint:CGPointMake(POINT_X_VEGGIE_CORN, POINT_Y_VEGGIE_CORN) withSize:screenSize]];
    default:
      return nil;
  }
  return nil;
}

+ (SKSpriteNode *)showClosestInhabitant:(CGPoint)location {
  Inhabitant *closestInhabitant = [[[ObidaoIsland alloc] init] closestInhabitantToPoint:location];
  SKSpriteNode *inhabitantSprite = [self createInhabitantSprite:closestInhabitant];
  return inhabitantSprite;
}

+ (SKSpriteNode *)createInhabitantSprite:(Inhabitant *)inhabitant {
  SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithTexture:[SKTexture textureWithImageNamed:[self inhabitantImageNameString:inhabitant.veggieType]]];
  if (IS_IPID) {
    sprite.xScale = sprite.yScale = 150.0 / sprite.size.width;
  }
  else {
    sprite.xScale = sprite.yScale = 50.0 / sprite.size.width;
  }
  sprite.position = inhabitant.position;
  sprite.anchorPoint = CGPointMake(0.5, 0);
  return sprite;
}

+ (NSString *)inhabitantImageNameString:(VeggieType)veggieType {
  return [ImageNameString getInhabitantImageNameOnIslandMap:veggieType];
}




@end
