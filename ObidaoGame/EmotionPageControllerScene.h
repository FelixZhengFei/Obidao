//
//  EmotionPageControllerScene.h
//  Obidao
//
//  Created by work on 8/2/13.
//  Copyright 2013 OriginateChina. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>
#import "Inhabitant.h"
#import "Emotion.h"

@interface EmotionPageControllerScene : SKScene


- (void)addBackButtonItem;
- (void)addBackgroundImage:(VeggieType)veggieType;
- (void)initAllThingsOfInhabitantPage:(VeggieType)veggieType;
- (void)showTheFirstComeVeggieEmotion:(VeggieType)veggieType;
@end
