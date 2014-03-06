//
//  StartGameScene.m
//  Obidao
//
//  Created by jiang jack on 6/13/13.
//  Copyright 2013 com.originate. All rights reserved.
//

#import "IslandMapScene.h"
#import "Defaults.h"
#import "Inhabitant.h"
#import "EggplantVeggiePage.h"
#import "CornVeggiePage.h"
#import "CarotVeegiePage.h"
#import "OnionVeggiePage.h"
#import "TomotoVeggiePage.h"
#import "PotatoVeggiePage.h"
#import "RadishVeggiePage.h"
#import "CucumberVeggiePage.h"
#import "ScreenScaleFactor.h"
@interface IslandMapScene () {
  SKSpriteNode *tomatoInhabitantSprite;
  SKSpriteNode *carrotInhabitantSprite;
  SKSpriteNode *onionInhabitantSprite;
  SKSpriteNode *radishInhabitantSprite;
  SKSpriteNode *eggplantInhabitantSprite;
  SKSpriteNode *potatoInhabitantSprite;
}

@end


@implementation IslandMapScene


-(id)initWithSize:(CGSize)size {
  if (self = [super initWithSize:size]) {
    [self addBackground];
    [self addAllInhabitants];
  }
  return self;
}

#pragma mark - Private methods

- (void)addBackground {
  SKSpriteNode *_backgroundIslandMap;
  _backgroundIslandMap = [SKSpriteNode spriteNodeWithTexture:[SKTexture textureWithImageNamed:@"island_map_ipadhd"]];
  _backgroundIslandMap.position = CGPointMake(CGRectGetMidX(self.frame),CGRectGetMidY(self.frame));
  _backgroundIslandMap.xScale = _backgroundIslandMap.yScale = 2;
  [self addChild:_backgroundIslandMap];
}

- (void)addAllInhabitants {
  eggplantInhabitantSprite = [Inhabitant createInbitants:VeggieEggplant size:self.size];
  [self addChild:eggplantInhabitantSprite];
  tomatoInhabitantSprite = [Inhabitant createInbitants:VeggieTomato size:self.size];
  [self addChild:tomatoInhabitantSprite];
  carrotInhabitantSprite = [Inhabitant createInbitants:VeggieCarot size:self.size];
  [self addChild:carrotInhabitantSprite];
  onionInhabitantSprite = [Inhabitant createInbitants:VeggieOnion size:self.size];
  [self addChild:onionInhabitantSprite];
  radishInhabitantSprite = [Inhabitant createInbitants:VeggieRadish size:self.size];
  [self addChild:radishInhabitantSprite];
  potatoInhabitantSprite = [Inhabitant createInbitants:VeggiePotato size:self.size];
  [self addChild:potatoInhabitantSprite];
}

- (BOOL)isTomatoInhabitantTouched:(CGPoint)location {
  return tomatoInhabitantSprite && CGRectContainsPoint(tomatoInhabitantSprite.frame, location);
}

- (BOOL)isCarrotInhabitantTouched:(CGPoint)location {
  return carrotInhabitantSprite && CGRectContainsPoint(carrotInhabitantSprite.frame, location);
}

- (BOOL)isOnionInhabitantSpriteTouched:(CGPoint)location {
  return onionInhabitantSprite && CGRectContainsPoint(onionInhabitantSprite.frame, location);
}

- (BOOL)isRadishInhabitantSpriteTouched:(CGPoint)location {
  return radishInhabitantSprite && CGRectContainsPoint(radishInhabitantSprite.frame, location);
}

- (BOOL)isEggplantInhabitantSpriteTouched:(CGPoint)location {
  return eggplantInhabitantSprite && CGRectContainsPoint(eggplantInhabitantSprite.frame, location);
}

- (BOOL)ispotatoInhabitantSpriteTouched:(CGPoint)location {
  return potatoInhabitantSprite && CGRectContainsPoint(potatoInhabitantSprite.frame, location);
}

#pragma mark -Touch Delegete

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
  
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
  UITouch *touch = [touches anyObject];
  if ([touch tapCount] == 1) {
    CGPoint location = [touch locationInNode:self];
    if ([self isEggplantInhabitantSpriteTouched:location]) {
      [self removeAllActions];
      EggplantVeggiePage *veggiePage = [[EggplantVeggiePage alloc] initWithSize:self.size];
      veggiePage.scaleMode = SKSceneScaleModeAspectFill;
      [self.view presentScene:veggiePage];
    } else if ([self isTomatoInhabitantTouched:location]) {
      [self removeAllActions];
      
      TomotoVeggiePage *veggiePage = [[TomotoVeggiePage alloc] initWithSize:self.size];
      veggiePage.scaleMode = SKSceneScaleModeAspectFill;
      [self.view presentScene:veggiePage];
    } else if([self isCarrotInhabitantTouched:location]) {
      [self removeAllActions];
      
      CarotVeegiePage *veggiePage = [[CarotVeegiePage alloc] initWithSize:self.size];
      veggiePage.scaleMode = SKSceneScaleModeAspectFill;
      [self.view presentScene:veggiePage];
    } else if([self isOnionInhabitantSpriteTouched:location]) {
      [self removeAllActions];
      
      OnionVeggiePage *veggiePage = [[OnionVeggiePage alloc] initWithSize:self.size];
      veggiePage.scaleMode = SKSceneScaleModeAspectFill;
      [self.view presentScene:veggiePage];
    }else if([self isRadishInhabitantSpriteTouched:location]) {
      [self removeAllActions];
      
      RadishVeggiePage *veggiePage = [[RadishVeggiePage alloc] initWithSize:self.size];
      veggiePage.scaleMode = SKSceneScaleModeAspectFill;
      [self.view presentScene:veggiePage];
    } else if ([self ispotatoInhabitantSpriteTouched:location]) {
      [self removeAllActions];
      
      PotatoVeggiePage *veggiePage = [[PotatoVeggiePage alloc] initWithSize:self.size];
      veggiePage.scaleMode = SKSceneScaleModeAspectFill;
      [self.view presentScene:veggiePage];;
    }
  }
}

- (void)willMoveFromView:(SKView *)view {
  [self removeAllActions];
  [self removeAllChildren];
}



@end
