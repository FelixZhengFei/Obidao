//
//  CucumberVeggiePage.m
//  Obidao
//
//  Created by work on 8/2/13.
//  Copyright 2013 OriginateChina. All rights reserved.
//

#import "CucumberVeggiePage.h"

@implementation CucumberVeggiePage

- (id)initWithSize:(CGSize)size {
  if (self = [super initWithSize:size]) {
    [self addBackgroundImage:VeggieCucumber];
    [self addBackButtonItem];
    [self initAllThingsOfInhabitantPage:VeggieCucumber];
    [self showTheFirstComeVeggieEmotion:VeggieCucumber];
  }
  return self;
}
@end
