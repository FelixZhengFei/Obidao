//
//  OnionVeggiePage.m
//  Obidao
//
//  Created by work on 8/2/13.
//  Copyright 2013 OriginateChina. All rights reserved.
//

#import "OnionVeggiePage.h"


@implementation OnionVeggiePage

- (id)initWithSize:(CGSize)size {
  if (self = [super initWithSize:size]) {
    [self addBackgroundImage:VeggieOnion];
    [self addBackButtonItem];
    [self initAllThingsOfInhabitantPage:VeggieOnion];
    [self showTheFirstComeVeggieEmotion:VeggieOnion];
  }
  return self;
}

@end
