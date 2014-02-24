//
//  NSString+SoundString.h
//  Obidao
//
//  Created by work on 6/24/13.
//  Copyright (c) 2013 OriginateChina. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Inhabitant.h"
#import "Emotion.h"

@interface SoundString : NSObject

+ (NSString *)getSoundNameStringWithInbitantType:(VeggieType)veggieType emotionType:(EmotionType)emotionType;

@end
