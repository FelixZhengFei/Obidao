//
//  NSString+SoundString.m
//  Obidao
//
//  Created by work on 6/24/13.
//  Copyright (c) 2013 OriginateChina. All rights reserved.
//

#import "SoundString.h"
#import "Defaults.h"
@implementation SoundString

+ (NSString *)getSoundNameStringWithInbitantType:(VeggieType)veggieType emotionType:(EmotionType)emotionType {
  NSString *veggieTypeName = [self soundStringWithInhabitantType:veggieType];
  NSString *emtionTypeName = [self soundStringWithEmotionType:emotionType];
  if (veggieTypeName == nil || emtionTypeName == nil) {
    return nil;
  }
  NSString *soundFileName = [NSString stringWithFormat:@"%@%@",veggieTypeName,emtionTypeName];
  return soundFileName;
}

+ (NSString *)soundStringWithInhabitantType:(VeggieType)veggieType {
  switch (veggieType) {
    case VeggieCorn: return @"corn_";
    case VeggieCarot: return @"carot_";
    case VeggieOnion: return @"onion_";
    case VeggieTomato: return @"tomato_";
    case VeggiePotato: return @"potato_";
    case VeggieRadish: return @"radish_";
    case VeggieCucumber: return @"cucumber_";
    case VeggieEggplant: return @"eggplant_";
    default: return nil;
  }
  return  nil;
}

+ (NSString *)soundStringWithEmotionType:(EmotionType)emotionType {
  switch (emotionType) {
    case Emotion_Fear:
      return  @"fear.wav";
    case Emotion_Surprise:
      return  @"surprise.wav";
    case Emotion_Disgust:
      return  @"disgust.wav";
    case Emotion_Anger:
      return  @"anger.wav";
    case Emotion_Sanness:
      return  @"sadness.wav";
    case Emotion_Happy:
      return  @"happy.wav";
    default:return nil;
  }
  return nil;
}

@end
