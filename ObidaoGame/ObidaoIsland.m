//
//  ObidaoIsland.m
//  Obidao
//
//  Created by Sherlock on 6/17/13.
//  Copyright (c) 2013 OriginateChina. All rights reserved.
//

#import "ObidaoIsland.h"
#import "CoordinateSystem.h"
#import "MathTool.h"
#import "Defaults.h"
@interface ObidaoIsland() {
  NSMutableArray *_veggieCoordinates;
}

@end

@implementation ObidaoIsland


- (id)init {
  self = [super init];
  if (self) {
    _veggieCoordinates = [[NSMutableArray alloc] initWithCapacity:10];
    [self loadVeggieCoordinates];
  }
  return self;
}

- (void)loadVeggieCoordinates {
  // Coordinates in resolution 1024 * 768 Landscape
  [_veggieCoordinates addObject:[NSValue valueWithCGPoint:CGPointMake(POINT_X_VEGGIE_CORN, POINT_Y_VEGGIE_CORN)]];
  [_veggieCoordinates addObject:[NSValue valueWithCGPoint:CGPointMake(POINT_X_VEGGIE_CAROT, POINT_Y_VEGGIE_CAROT)]];
  [_veggieCoordinates addObject:[NSValue valueWithCGPoint:CGPointMake(POINT_X_VEGGIE_ONION, POINT_Y_VEGGIE_ONION)]];
  [_veggieCoordinates addObject:[NSValue valueWithCGPoint:CGPointMake(POINT_X_VEGGIE_TOMATO, POINT_Y_VEGGIE_TOMATO)]];
  [_veggieCoordinates addObject:[NSValue valueWithCGPoint:CGPointMake(POINT_X_VEGGIE_POTATO, POINT_Y_VEGGIE_POTATO)]];
  [_veggieCoordinates addObject:[NSValue valueWithCGPoint:CGPointMake(POINT_X_VEGGIE_RADISH, POINT_Y_VEGGIE_RADISH)]];
  [_veggieCoordinates addObject:[NSValue valueWithCGPoint:CGPointMake(POINT_X_VEGGIE_CUCUMBER, POINT_Y_VEGGIE_CUCUMBER)]];
  [_veggieCoordinates addObject:[NSValue valueWithCGPoint:CGPointMake(POINT_X_VEGGIE_EGGPLANT, POINT_Y_VEGGIE_EGGPLANT)]];
}

#pragma mark - Public methods

- (Inhabitant *)closestInhabitantToPoint:(CGPoint)point {
  NSInteger currentVeggieIndex = 0;
  CGFloat currentDistance = 999999.0;
  CGSize screenSize  = [[UIScreen mainScreen] bounds].size;
  NSLog(@"screenSize =%@",NSStringFromCGSize(screenSize));
  for (int i = 0; i < [_veggieCoordinates count]; i++) {
    CGPoint veggiePoint = [CoordinateSystem fixedPoint:[[_veggieCoordinates objectAtIndex:i] CGPointValue] withSize:screenSize];
    CGFloat distance = [MathTool distanceFrom:point to:veggiePoint];
    if (distance < currentDistance) {
      currentVeggieIndex = i;
      currentDistance = distance;
    }
  }
  Inhabitant *inhabitant = [[Inhabitant alloc] init];
  inhabitant.veggieType = currentVeggieIndex;
  inhabitant.position = [CoordinateSystem fixedPoint:[[_veggieCoordinates objectAtIndex:currentVeggieIndex] CGPointValue] withSize:screenSize];

  return inhabitant;
}


@end
