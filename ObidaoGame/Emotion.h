//
//  Emotion.h
//  FirstGame
//
//  Created by work on 6/14/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Inhabitant.h"
#import "Defaults.h"

typedef NS_ENUM(NSInteger, EmotionType) {
	Emotion_Happy = 1,
	Emotion_Surprise = 2,
  Emotion_Disgust = 3,
  Emotion_Anger = 4,
  Emotion_Sanness = 5,
  Emotion_Fear = 6
};

@interface Emotion : NSObject

@property (nonatomic,copy) NSString *emtionName;
@property (nonatomic,assign) EmotionType emotionType;

@end
