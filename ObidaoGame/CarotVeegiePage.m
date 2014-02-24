//
//  CarotVeegiePage.m
//  Obidao
//
//  Created by work on 8/2/13.
//  Copyright 2013 OriginateChina. All rights reserved.
//

#import "CarotVeegiePage.h"

@implementation CarotVeegiePage

- (id)initWithSize:(CGSize)size {
  if (self = [super initWithSize:size]) {
    [self addBackgroundImage:VeggieCarot];
    [self addBackButtonItem];
    [self initAllThingsOfInhabitantPage:VeggieCarot];
    [self showTheFirstComeVeggieEmotion:VeggieCarot];
  }
  return self;
}

@end
