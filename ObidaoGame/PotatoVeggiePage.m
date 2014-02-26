//felix
//  PotatoVeggiePage.m
//  Obidao
//
//  Created by work on 8/2/13.
//  Copyright 2013 OriginateChina. All rights reserved.
//

#import "PotatoVeggiePage.h"

@implementation PotatoVeggiePage

- (id)initWithSize:(CGSize)size {
  if (self = [super initWithSize:size]) {
    [self addBackgroundImage:VeggiePotato];
    [self addBackButtonItem];
    [self initAllThingsOfInhabitantPage:VeggiePotato];
    [self showTheFirstComeVeggieEmotion:VeggiePotato];
  }
  return self;
}

@end
