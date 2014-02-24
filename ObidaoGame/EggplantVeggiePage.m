//
//  EggplantVeggiePage.m
//  Obidao
//
//  Created by work on 8/2/13.
//  Copyright 2013 OriginateChina. All rights reserved.
//

#import "EggplantVeggiePage.h"

@implementation EggplantVeggiePage


- (id)initWithSize:(CGSize)size {
  if (self = [super initWithSize:size]) {
    [self addBackgroundImage:VeggieEggplant];
    [self addBackButtonItem];
    [self initAllThingsOfInhabitantPage:VeggieEggplant];
    [self showTheFirstComeVeggieEmotion:VeggieEggplant];
  }
  return self;
}


@end
