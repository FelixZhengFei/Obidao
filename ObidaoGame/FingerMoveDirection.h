//
//  FingerMoveDirection.h
//  Obidao
//
//  Created by work on 7/26/13.
//  Copyright (c) 2013 OriginateChina. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef enum {
	GameDirNone = 0,
	GameDirUp = 1,
	GameDirDown = 2,
	GameDirLeft = 3,
	GameDirRight = 4
} GameDirs;

@interface FingerMoveDirection : NSObject

+ (NSUInteger) swipeDirectionStart:(CGPoint)start end:(CGPoint)end;
+ (NSMutableArray*) explodeDelimiter:(NSString*)delimiter string:(NSString*)str;

@end
