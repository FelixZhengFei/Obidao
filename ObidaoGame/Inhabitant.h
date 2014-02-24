//
//  Inhabitant.h
//  Obidao
//
//  Created by Sherlock on 6/17/13.
//  Copyright (c) 2013 OriginateChina. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Defaults.h"
#import <SpriteKit/SpriteKit.h>

typedef NS_ENUM(NSInteger, VeggieType) {
  VeggieCorn = 0,//yu mi
  VeggieCarot = 1,//hu luo bo
  VeggieOnion = 2,//yang chong
  VeggieTomato = 3,//fan qie
  VeggiePotato = 4,// tu dou
  VeggieRadish = 5,// luo bo
  VeggieCucumber = 6,//huang gua
  VeggieEggplant = 7//qie zi
};

@interface Inhabitant : NSObject

@property (nonatomic, assign) VeggieType veggieType;
@property (nonatomic, assign) CGPoint position;


+ (SKSpriteNode *)createInbitants:(VeggieType)veggieType size:(CGSize)winSize;

@end
