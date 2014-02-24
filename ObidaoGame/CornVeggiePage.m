//
//  CornVeggiePage.m
//  Obidao
//
//  Created by work on 8/2/13.
//  Copyright 2013 OriginateChina. All rights reserved.
//

#import "CornVeggiePage.h"
#import <SpriteKit/SpriteKit.h>
@implementation CornVeggiePage

- (id)initWithSize:(CGSize)size {
  if ((self = [super init])) {
    [self addBackgroundImage:VeggieCorn];
    [self addBackButtonItem];
    [self initAllThingsOfInhabitantPage:VeggieCorn];
    [self showTheFirstComeVeggieEmotion:VeggieCorn];
  }
  return self;
}













@end
