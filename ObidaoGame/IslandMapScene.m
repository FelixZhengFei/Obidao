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
      [self runUpAndDown:eggplantInhabitantSprite];
      [SKTextureAtlas preloadTextureAtlases:@[[SKTextureAtlas atlasNamed:@"ina_paly_ball."],[SKTextureAtlas atlasNamed:@"ina_happy_down"],[SKTextureAtlas atlasNamed:@"surprise"],[SKTextureAtlas atlasNamed:@"ina_anger"],[SKTextureAtlas atlasNamed:@"ina_cry"],[SKTextureAtlas atlasNamed:@"ina_head"],[SKTextureAtlas atlasNamed:@"ina_high"]] withCompletionHandler:^{
        [self removeAllActions];
        EggplantVeggiePage *veggiePage = [[EggplantVeggiePage alloc] initWithSize:self.size];
        veggiePage.scaleMode = SKSceneScaleModeAspectFill;
        [self.view presentScene:veggiePage];
      }];
      
    } else if ([self isTomatoInhabitantTouched:location]) {
      [self runUpAndDown:tomatoInhabitantSprite];
      [SKTextureAtlas preloadTextureAtlases:@[[SKTextureAtlas atlasNamed:@"tomato_happy"],[SKTextureAtlas atlasNamed:@"tomato_surprise"],[SKTextureAtlas atlasNamed:@"tomato_anger"],[SKTextureAtlas atlasNamed:@"tomato_cry"],[SKTextureAtlas atlasNamed:@"tomato_fear"]] withCompletionHandler:^{
        [self removeAllActions];
        TomotoVeggiePage *veggiePage = [[TomotoVeggiePage alloc] initWithSize:self.size];
        veggiePage.scaleMode = SKSceneScaleModeAspectFill;
        [self.view presentScene:veggiePage];
      }];
      
    } else if([self isCarrotInhabitantTouched:location]) {
      
      [self runUpAndDown:carrotInhabitantSprite];
      [SKTextureAtlas preloadTextureAtlases:@[[SKTextureAtlas atlasNamed:@"carrot_happy"],[SKTextureAtlas atlasNamed:@"ballon_deceare"],[SKTextureAtlas atlasNamed:@"carrot_increase"],[SKTextureAtlas atlasNamed:@"carrot_scare"],[SKTextureAtlas atlasNamed:@"carrot_surprise"],[SKTextureAtlas atlasNamed:@"cattot_happy_play"],[SKTextureAtlas atlasNamed:@"cattot_next_ball"]] withCompletionHandler:^{
        [self removeAllActions];
        CarotVeegiePage *veggiePage = [[CarotVeegiePage alloc] initWithSize:self.size];
        veggiePage.scaleMode = SKSceneScaleModeAspectFill;
        [self.view presentScene:veggiePage];
      }];
      
    } else if([self isOnionInhabitantSpriteTouched:location]) {
      [self runUpAndDown:onionInhabitantSprite];
      [SKTextureAtlas preloadTextureAtlases:@[[SKTextureAtlas atlasNamed:@"onion_anger"],[SKTextureAtlas atlasNamed:@"onion_cry"],[SKTextureAtlas atlasNamed:@"onion_surprise"]] withCompletionHandler:^{
        OnionVeggiePage *veggiePage = [[OnionVeggiePage alloc] initWithSize:self.size];
        veggiePage.scaleMode = SKSceneScaleModeAspectFill;
        [self.view presentScene:veggiePage];
      }];

    }else if([self isRadishInhabitantSpriteTouched:location]) {
      [self runUpAndDown:radishInhabitantSprite];
      [SKTextureAtlas preloadTextureAtlases:@[[SKTextureAtlas atlasNamed:@"radish_happy_poor"],[SKTextureAtlas atlasNamed:@"radish_happy"],[SKTextureAtlas atlasNamed:@"radish_eat_1"],[SKTextureAtlas atlasNamed:@"radish_eat_2"],[SKTextureAtlas atlasNamed:@"radish_eat_3"],[SKTextureAtlas atlasNamed:@"raddish_cry"]] withCompletionHandler:^{
        [self removeAllActions];
        RadishVeggiePage *veggiePage = [[RadishVeggiePage alloc] initWithSize:self.size];
        veggiePage.scaleMode = SKSceneScaleModeAspectFill;
        [self.view presentScene:veggiePage];
      }];

    } else if ([self ispotatoInhabitantSpriteTouched:location]) {
      [self runUpAndDown:potatoInhabitantSprite];
      [SKTextureAtlas preloadTextureAtlases:@[[SKTextureAtlas atlasNamed:@"corn_walk"],[SKTextureAtlas atlasNamed:@"potato_walk"],[SKTextureAtlas atlasNamed:@"cucumber_join"],[SKTextureAtlas atlasNamed:@"corn_happy"],[SKTextureAtlas atlasNamed:@"potato_happy"],[SKTextureAtlas atlasNamed:@"potato_lost"]] withCompletionHandler:^{
        [self removeAllActions];
        PotatoVeggiePage *veggiePage = [[PotatoVeggiePage alloc] initWithSize:self.size];
        veggiePage.scaleMode = SKSceneScaleModeAspectFill;
        [self.view presentScene:veggiePage];;
      }];
      [self removeAllActions];
    }
  }
}

- (void)willMoveFromView:(SKView *)view {
  [self removeAllActions];
  [self removeAllChildren];
}

- (void)runUpAndDown:(SKSpriteNode *)sprite {
  SKAction *scale1 = [SKAction scaleTo:60.0 / sprite.size.width duration:0.1];
  SKAction *scale2 = [SKAction scaleTo:65.0 / sprite.size.width duration:0.1];
  SKAction *scale3 = [SKAction scaleTo:70.0 / sprite.size.width duration:0.1];
  SKAction *scale4 = [SKAction scaleTo:65.0 / sprite.size.width duration:0.1];
  SKAction *scale5 = [SKAction scaleTo:60.0 / sprite.size.width duration:0.1];
  SKAction *scale6 = [SKAction scaleTo:55.0 / sprite.size.width duration:0.1];
  [sprite runAction:[SKAction repeatActionForever:[SKAction sequence:@[scale1,scale2,scale3,scale4,scale5,scale6]]]];
}

@end
