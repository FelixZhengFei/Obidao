//
//  TomotoVeggiePage.m
//  Obidao
//
//  Created by work on 8/2/13.
//  Copyright 2013 OriginateChina. All rights reserved.
//

#import "TomotoVeggiePage.h"


@implementation TomotoVeggiePage

- (id)initWithSize:(CGSize)size {
  if (self = [super initWithSize:size]) {
    [self addBackgroundImage:VeggieTomato];
    [self addBackButtonItem];
    [self initAllThingsOfInhabitantPage:VeggieTomato];
    [self showTheFirstComeVeggieEmotion:VeggieTomato];
  }
  return self;
}

@end
