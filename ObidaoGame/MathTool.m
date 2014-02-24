//
//  MathTool.m
//  Obidao
//
//  Created by Sherlock on 6/17/13.
//  Copyright (c) 2013 OriginateChina. All rights reserved.
//

#import "MathTool.h"

#define fequal(a,b) (fabs((a) - (b)) < FLT_EPSILON)

@implementation MathTool

+ (CGFloat)distanceFrom:(CGPoint)point1 to:(CGPoint)point2 {
  return sqrt(pow((point1.x - point2.x), 2.0) + pow((point1.y - point2.y), 2.0));
}

+ (BOOL)samePoint:(CGPoint)point1 with:(CGPoint)point2 {
  return fequal(point1.x, point2.x) && fequal(point1.y, point2.y);
}

@end
