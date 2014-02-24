//
//  ObidaoIsland.h
//  Obidao
//
//  Created by Sherlock on 6/17/13.
//  Copyright (c) 2013 OriginateChina. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Inhabitant.h"

@interface ObidaoIsland : NSObject

- (id)init;

- (Inhabitant *)closestInhabitantToPoint:(CGPoint)point;

@end
