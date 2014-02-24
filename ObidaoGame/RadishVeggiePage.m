//
//  RadishVeggiePage.m
//  Obidao
//
//  Created by work on 8/2/13.
//  Copyright 2013 OriginateChina. All rights reserved.
//

#import "RadishVeggiePage.h"

@implementation RadishVeggiePage

- (id)initWithSize:(CGSize)size {
  if (self = [super initWithSize:size]) {
    [self addBackgroundImage:VeggieRadish];
    [self addBackButtonItem];
    [self initAllThingsOfInhabitantPage:VeggieRadish];
    [self showTheFirstComeVeggieEmotion:VeggieRadish];
  }
  return self;
}

@end
