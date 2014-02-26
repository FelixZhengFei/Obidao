//
//  Emotion.h
//  FirstGame
//
//  Created by work on 6/20/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#define WINSIZE_WIDTH     [[UIScreen mainScreen] bounds].size.width
#define WINSIZE_HEIGHT    [[UIScreen mainScreen] bounds].size.height

#define IS_IPHONE5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define IS_IPID 	[[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad ? YES : NO
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_RETINA ([[UIScreen mainScreen] scale] == 2.0f)

#define POINT_X_VEGGIE_CORN      400.0
#define POINT_Y_VEGGIE_CORN      470.0
#define POINT_X_VEGGIE_CAROT     740.0
#define POINT_Y_VEGGIE_CAROT     280.0
#define POINT_X_VEGGIE_ONION     288.0
#define POINT_Y_VEGGIE_ONION     390.0
#define POINT_X_VEGGIE_TOMATO    228.0
#define POINT_Y_VEGGIE_TOMATO    260.0
#define POINT_X_VEGGIE_POTATO    548.0
#define POINT_Y_VEGGIE_POTATO    210.0
#define POINT_X_VEGGIE_RADISH    558.0
#define POINT_Y_VEGGIE_RADISH    400.0
#define POINT_X_VEGGIE_CUCUMBER  298.0
#define POINT_Y_VEGGIE_CUCUMBER  700.0
#define POINT_X_VEGGIE_EGGPLANT  500.0
#define POINT_Y_VEGGIE_EGGPLANT  298.0















