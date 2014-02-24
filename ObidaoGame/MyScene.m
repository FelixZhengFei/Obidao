//
//  MyScene.m
//  ObidaoGame
//
//  Created by work on 12/16/13.
//  Copyright (c) 2013 Originate Inc. All rights reserved.
//

#import "MyScene.h"

@implementation MyScene

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
      
        self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {

}

-(void)update:(CFTimeInterval)currentTime {
}

@end
