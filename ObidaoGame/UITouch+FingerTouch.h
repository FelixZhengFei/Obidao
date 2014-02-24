//
//  UITouch+FingerTouch.h
//  ObidaoGame
//
//  Created by work on 12/20/13.
//  Copyright (c) 2013 Originate Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CCSprite+SpriteTransparency.h"
#import "ImageNameString.h"
#import "SKAction+Helper.h"
#import "MyAVAudioPlayer.h"
#import "Inhabitant.h"
@interface UITouch (FingerTouch)

+ (SKAction *)fingerClickAtOneTime:(VeggieType)_currentVeggieType soundPlay:(MyAVAudioPlayer *)_soundPlayer;
+ (SKAction *)fingerClickAtTwoTime:(VeggieType)_currentVeggieType soundPlay:(MyAVAudioPlayer *)_soundPlayer;
+ (SKAction *)fingerClickAtThreeTime:(VeggieType)_currentVeggieType soundPlay:(MyAVAudioPlayer *)_soundPlayer;
+ (SKAction *)fingerClickAtFourTime:(VeggieType)_currentVeggieType soundPlay:(MyAVAudioPlayer *)_soundPlayer;
+ (SKAction *)fingerClickAtFiveTime:(VeggieType)_currentVeggieType soundPlay:(MyAVAudioPlayer *)_soundPlayer;
+ (SKAction *)fingerClickAtSixTime:(VeggieType)_currentVeggieType soundPlay:(MyAVAudioPlayer *)_soundPlayer;

@end
