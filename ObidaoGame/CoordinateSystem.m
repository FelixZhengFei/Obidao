//
//  CoordinateSystem.m
//  Obidao
//
//  Created by Sherlock on 6/17/13.
//  Copyright (c) 2013 OriginateChina. All rights reserved.
//

#import "CoordinateSystem.h"

#define ORIGIN_WIDTH 1024
#define ORIGIN_HEIGHT 768

@implementation CoordinateSystem

+ (CGPoint)fixedPoint:(CGPoint)point withSize:(CGSize)size{
  return CGPointMake(point.x * size.width / ORIGIN_WIDTH, point.y * size.height / ORIGIN_HEIGHT);
}


@end
