//
//  CCSprite+SpriteTransparency.h
//  Obidao
//
//  Created by work on 12/9/13.
//  Copyright (c) 2013 OriginateChina. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SpriteKit/SpriteKit.h>
#import "Inhabitant.h"

@interface SKSpriteNode (SpriteTransparency)

+ (BOOL)containsTouchLocation:(CGPoint)local veggieType:(VeggieType)veggieType;

@end
