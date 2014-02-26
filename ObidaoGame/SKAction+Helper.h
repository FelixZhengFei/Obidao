//
//  SKAction+Helper.h
//  ObidaoGame
//
//  Created by work on 12/19/13.
//  Copyright (c) 2013 Originate Inc. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "Inhabitant.h"
#import "Emotion.h"

@interface SKAction (Helper)

+ (SKAction *)happyAnimationWithInhabitantType:(VeggieType)veggieType;
+ (SKAction *)angerAnimationWithInhabitantType:(VeggieType)veggieType;
+ (SKAction *)surpriseAnimationWithInhabitantType:(VeggieType)veggieType;
+ (SKAction *)sadAnimationWithInhabitantType:(VeggieType)veggieType;
+ (SKAction *)scareAnimationWithInhabitantType:(VeggieType)veggieType;
+ (SKAction *)disgustAnimationWithInhabitantType:(VeggieType)veggieType;
+ (SKAction *)noEmotionAnimationWithInhabitantType:(VeggieType)veggieType;

+ (SKAction *)foxyCryAnimation;
+ (SKAction *)carrotPlayBallon:(BOOL)isBlowing;
+ (SKAction *)radishStartEatSand;
+ (SKAction *)radishEattingSand;
+ (SKAction *)eggplantBallDisappear;
+ (SKAction *)eggplantBallHitHead;
+ (SKAction *)eggplantBallDown;
+ (SKAction *)cornSpriteWalks;
+ (SKAction *)potatoSpriteWalks;

@end
