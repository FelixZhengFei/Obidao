//
//  UITouch+FingerTouch.m
//  ObidaoGame
//
//  Created by work on 12/20/13.
//  Copyright (c) 2013 Originate Inc. All rights reserved.
//

#import "UITouch+FingerTouch.h"

@implementation UITouch (FingerTouch)

+ (SKAction *)fingerClickAtOneTime:(VeggieType)_currentVeggieType soundPlay:(MyAVAudioPlayer *)_soundPlayer {
  if (_currentVeggieType == VeggieOnion) {
    SKAction *soundAction = [SKAction sequence:@[[SKAction waitForDuration:.80],[SKAction runBlock:^{
      [_soundPlayer upDateSoundPlayerUnderEmotionType:Emotion_Happy];
    }]]];
    SKAction *action0 = [SKAction repeatAction:[SKAction happyAnimationWithInhabitantType:_currentVeggieType] count:5] ;
    SKAction *action1 = [self fingerClickAtTwoTime:_currentVeggieType soundPlay:_soundPlayer];
    return [SKAction group:@[soundAction,[SKAction sequence:@[action0,action1]]]];
    
  } else if (_currentVeggieType == VeggieTomato) {
    SKAction *soundAction = [SKAction sequence:@[[SKAction waitForDuration:.80],[SKAction runBlock:^{
      [_soundPlayer upDateSoundPlayerUnderEmotionType:Emotion_Surprise];
    }]]];
    SKAction *action0 = [SKAction repeatAction:[SKAction surpriseAnimationWithInhabitantType:_currentVeggieType] count:5] ;
    SKAction *action1 = [SKAction runBlock:^{[self fingerClickAtTwoTime:_currentVeggieType soundPlay:_soundPlayer];}];
   return [SKAction group:@[soundAction,[SKAction sequence:@[action0,action1]]]];
    
  } else if (_currentVeggieType == VeggieCarot) {
    SKAction *action0 = [SKAction repeatAction:[SKAction noEmotionAnimationWithInhabitantType:_currentVeggieType] count:5] ;
    SKAction *action1 = [SKAction runBlock:^{[self fingerClickAtTwoTime:_currentVeggieType soundPlay:_soundPlayer];}];
   return [SKAction sequence:@[action0,action1]];
    
//    _ballSpriteNode = [SKSpriteNode spriteNodeWithImageNamed:@"blowing_balloon1.png"];
//    _ballSpriteNode.position = CGPointMake(WINSIZE_WIDTH * 0.47, WINSIZE_HEIGHT * 0.525);
//    _ballSpriteNode.anchorPoint = CGPointMake(0,1);
//    [self addChild:_ballSpriteNode];
//    [_ballSpriteNode runAction:[SKAction carrotPlayBallon:YES]];
    
  } else if (_currentVeggieType == VeggieRadish) {
    SKAction *soundAction = [SKAction sequence:@[[SKAction waitForDuration:.80],[SKAction runBlock:^{
      [_soundPlayer upDateSoundPlayerUnderEmotionType:Emotion_Happy];
    }]]];
    SKAction *action0 = [SKAction repeatAction:[SKAction happyAnimationWithInhabitantType:_currentVeggieType] count:5] ;
    SKAction *action1 = [SKAction runBlock:^{[self fingerClickAtTwoTime:_currentVeggieType soundPlay:_soundPlayer];}];
    return  [SKAction group:@[soundAction,[SKAction sequence:@[action0,action1]]]];
    
  } else if (_currentVeggieType == VeggieEggplant) {
    SKAction *soundAction = [SKAction sequence:@[[SKAction waitForDuration:.80],[SKAction runBlock:^{
      [_soundPlayer upDateSoundPlayerUnderEmotionType:Emotion_Happy];
    }]]];
    SKAction *action0 = [SKAction repeatAction:[SKAction happyAnimationWithInhabitantType:_currentVeggieType] count:5] ;
    SKAction *action1 = [SKAction runBlock:^{[self fingerClickAtTwoTime:_currentVeggieType soundPlay:_soundPlayer];}];
    return [SKAction group:@[soundAction,[SKAction sequence:@[action0,action1]]]];
  }
  else {
  }
  return nil;
}

+ (SKAction *)fingerClickAtTwoTime:(VeggieType)_currentVeggieType soundPlay:(MyAVAudioPlayer *)_soundPlayer {
  if (_currentVeggieType == VeggieOnion) {
    SKAction *soundAction = [SKAction sequence:@[[SKAction waitForDuration:.80],[SKAction runBlock:^{
      [_soundPlayer upDateSoundPlayerUnderEmotionType:Emotion_Anger];
    }]]];
    SKAction *action0 = [SKAction repeatAction:[SKAction angerAnimationWithInhabitantType:_currentVeggieType] count:5] ;
    return  [SKAction group:@[action0,soundAction]];
  
  } else if (_currentVeggieType == VeggieTomato) {
    SKAction *soundAction = [SKAction sequence:@[[SKAction waitForDuration:1.0],[SKAction runBlock:^{
      [_soundPlayer upDateSoundPlayerUnderEmotionType:Emotion_Anger];
    }]]];
    SKAction *action0 = [SKAction repeatAction:[SKAction sadAnimationWithInhabitantType:_currentVeggieType] count:5] ;
    return [SKAction group:@[action0,soundAction]];
    
  } else if (_currentVeggieType == VeggieCarot) {
  //  [_ballSpriteNode removeFromParent];
    SKAction *soundAction = [SKAction sequence:@[[SKAction waitForDuration:.20],[SKAction runBlock:^{
      [_soundPlayer upDateSoundPlayerUnderEmotionType:Emotion_Happy];
    }]]];
    SKAction *action0 = [SKAction repeatAction:[SKAction happyAnimationWithInhabitantType:_currentVeggieType] count:5] ;
    return [SKAction group:@[action0,soundAction]];
    
  } else if (_currentVeggieType == VeggieRadish) {
    SKAction *soundAction = [SKAction sequence:@[[SKAction waitForDuration:.50],[SKAction runBlock:^{
      [_soundPlayer upDateSoundPlayerUnderEmotionType:Emotion_Sanness];
    }]]];
    SKAction *action0 = [SKAction repeatAction:[SKAction sadAnimationWithInhabitantType:_currentVeggieType] count:5] ;
    return [SKAction group:@[action0,soundAction]];
  }
  else {
  }
  return nil;
}

+ (SKAction *)fingerClickAtThreeTime:(VeggieType)_currentVeggieType soundPlay:(MyAVAudioPlayer *)_soundPlayer {
  if (_currentVeggieType == VeggieOnion) {
    SKAction *soundAction = [SKAction sequence:@[[SKAction waitForDuration:1.20],[SKAction runBlock:^{
      [_soundPlayer upDateSoundPlayerUnderEmotionType:Emotion_Happy];
    }]]];
    SKAction *action0 = [SKAction repeatAction:[SKAction happyAnimationWithInhabitantType:_currentVeggieType] count:4];
    SKAction *action1 = [SKAction sadAnimationWithInhabitantType:_currentVeggieType];
    SKAction *action2 = [SKAction runBlock:^{
      [_soundPlayer upDateSoundPlayerUnderEmotionType:Emotion_Sanness];
    }];
    SKAction *action3 = [SKAction foxyCryAnimation];
  return [SKAction group:@[[SKAction sequence:@[action0,action1,[SKAction group:@[action2,action3]]]],soundAction]];
    
  } else if (_currentVeggieType == VeggieTomato) {
    SKAction *soundAction = [SKAction sequence:@[[SKAction waitForDuration:.80],[SKAction runBlock:^{
      [_soundPlayer upDateSoundPlayerUnderEmotionType:Emotion_Surprise];
    }]]];
    SKAction *action0 = [SKAction repeatAction:[SKAction surpriseAnimationWithInhabitantType:_currentVeggieType] count:4];
    SKAction *action1 = [SKAction runBlock:^{
      [_soundPlayer upDateSoundPlayerUnderEmotionType:Emotion_Anger];
    }];
    SKAction *action2 = [SKAction repeatAction:[SKAction angerAnimationWithInhabitantType:_currentVeggieType] count:4];
    return [SKAction group:@[[SKAction sequence:@[action0,[SKAction group:@[action1,action2]]]],soundAction]];
    
  } else if (_currentVeggieType == VeggieCarot){
    SKAction *soundAction = [SKAction sequence:@[[SKAction waitForDuration:.50],[SKAction runBlock:^{
      [_soundPlayer upDateSoundPlayerUnderEmotionType:Emotion_Surprise];
    }]]];
    SKAction *action0 = [SKAction sadAnimationWithInhabitantType:_currentVeggieType];
    SKAction *action1 = [SKAction repeatAction:[SKAction surpriseAnimationWithInhabitantType:_currentVeggieType] count:5];
    return [SKAction group:@[[SKAction sequence:@[action0,action1]],soundAction]];
    
  } else if (_currentVeggieType == VeggieRadish) {
    SKAction *soundAction = [SKAction sequence:@[[SKAction waitForDuration:4.50],[SKAction runBlock:^{
      [_soundPlayer upDateSoundPlayerUnderEmotionType:Emotion_Disgust];
    }]]];
    SKAction *action0 = [SKAction radishStartEatSand];
    SKAction *action1 = [SKAction radishEattingSand];
    SKAction *action2 = [SKAction waitForDuration:1.5];
    SKAction *action3 = [SKAction repeatAction:[SKAction disgustAnimationWithInhabitantType:_currentVeggieType] count:5];
    SKAction *action4 = [SKAction waitForDuration:1.5];
    SKAction *action5 = [SKAction runBlock:^{
      [_soundPlayer upDateSoundPlayerUnderEmotionType:Emotion_Happy];
    }];
    SKAction *action6 = [SKAction repeatAction:[SKAction surpriseAnimationWithInhabitantType:_currentVeggieType] count:5];
    return [SKAction group:@[[SKAction sequence:@[action0,action1,action2,action3,action4,[SKAction group:@[action5,action6]]]],soundAction]];
    
  } else if (_currentVeggieType == VeggieEggplant) {
    SKAction *soundAction = [SKAction sequence:@[[SKAction waitForDuration:1.50],[SKAction runBlock:^{
      [_soundPlayer upDateSoundPlayerUnderEmotionType:Emotion_Surprise];
    }]]];
    SKAction *action0 = [SKAction eggplantBallDisappear];
    SKAction *action1 = [SKAction repeatAction:[SKAction surpriseAnimationWithInhabitantType:_currentVeggieType] count:4];
    return [SKAction group:@[[SKAction sequence:@[action0,action1]],soundAction]];
  }
  else {
  }
  return nil;
}

+ (SKAction *)fingerClickAtFourTime:(VeggieType)_currentVeggieType soundPlay:(MyAVAudioPlayer *)_soundPlayer {
  if (_currentVeggieType == VeggieOnion) {
    SKAction *soundAction = [SKAction sequence:@[[SKAction waitForDuration:1.20],[SKAction runBlock:^{
      [_soundPlayer upDateSoundPlayerUnderEmotionType:Emotion_Happy];
    }]]];
    SKAction *action0 = [SKAction repeatAction:[SKAction happyAnimationWithInhabitantType:_currentVeggieType] count:5];
    return [SKAction group:@[soundAction,action0]];
    
  } else if (_currentVeggieType == VeggieTomato) {
    SKAction *soundAction = [SKAction sequence:@[[SKAction waitForDuration:1.0],[SKAction runBlock:^{
      [_soundPlayer upDateSoundPlayerUnderEmotionType:Emotion_Fear];
    }]]];
    SKAction *action0 = [SKAction repeatAction:[SKAction scareAnimationWithInhabitantType:_currentVeggieType] count:4];
    SKAction *action1 = [SKAction runBlock:^{
      [_soundPlayer upDateSoundPlayerUnderEmotionType:Emotion_Happy];
    }];
    SKAction *action2 = [SKAction repeatAction:[SKAction happyAnimationWithInhabitantType:_currentVeggieType] count:2];
    return [SKAction group:@[soundAction,[SKAction sequence:@[action0,action1,action2]]]];
    
  } else if (_currentVeggieType == VeggieCarot) {
    SKAction *soundAction = [SKAction sequence:@[[SKAction waitForDuration:3.0],[SKAction runBlock:^{
      [_soundPlayer upDateSoundPlayerUnderEmotionType:Emotion_Fear];
    }]]];
    SKAction *action0 = [SKAction repeatAction:[SKAction noEmotionAnimationWithInhabitantType:_currentVeggieType] count:5];
    SKAction *action1 = [SKAction runBlock:^{
   //   [_ballSpriteNode removeFromParent];
    }];
    SKAction *action2 = [SKAction happyAnimationWithInhabitantType:_currentVeggieType];
    SKAction *action3 =[SKAction scareAnimationWithInhabitantType:_currentVeggieType];
    SKAction *action4 =[SKAction angerAnimationWithInhabitantType:_currentVeggieType];
    return [SKAction group:@[soundAction,[SKAction sequence:@[action0,action1,action2,action3,action4]]]];
//    _ballSpriteNode = [SKSpriteNode spriteNodeWithImageNamed:@"blowing_balloon1.png"];
//    _ballSpriteNode.position = CGPointMake(WINSIZE_WIDTH * 0.47, WINSIZE_HEIGHT * 0.525);
//    _ballSpriteNode.anchorPoint = CGPointMake(0,1);
//    [self addChild:_ballSpriteNode];
//    [_ballSpriteNode runAction:[SKAction carrotPlayBallon:YES]];
    
  } else if (_currentVeggieType == VeggieRadish) {
    SKAction *soundAction = [SKAction sequence:@[[SKAction waitForDuration:.50],[SKAction runBlock:^{
      [_soundPlayer upDateSoundPlayerUnderEmotionType:Emotion_Happy];
    }]]];
    SKAction *action0 = [SKAction repeatAction:[SKAction happyAnimationWithInhabitantType:_currentVeggieType] count:5];
    return [SKAction group:@[soundAction,action0]];
    
  } else if (_currentVeggieType == VeggieEggplant) {
    SKAction *soundAction = [SKAction sequence:@[[SKAction waitForDuration:1.80],[SKAction runBlock:^{
      [_soundPlayer upDateSoundPlayerUnderEmotionType:Emotion_Sanness];
    }]]];
    SKAction *action0 = [SKAction eggplantBallHitHead];
    SKAction *action1 = [SKAction repeatAction:[SKAction sadAnimationWithInhabitantType:_currentVeggieType] count:5];
    return [SKAction group:@[soundAction,[SKAction sequence:@[action0,action1]]]];
  }
  else {
  }
  return nil;
}

+ (SKAction *)fingerClickAtFiveTime:(VeggieType)_currentVeggieType soundPlay:(MyAVAudioPlayer *)_soundPlayer {
  if (_currentVeggieType == VeggieEggplant) {
    SKAction *soundAction = [SKAction sequence:@[[SKAction waitForDuration:1.40],[SKAction runBlock:^{
      [_soundPlayer upDateSoundPlayerUnderEmotionType:Emotion_Anger];
    }]]];
    SKAction *action0 = [SKAction eggplantBallDisappear];
    SKAction *action1 = [SKAction repeatAction:[SKAction angerAnimationWithInhabitantType:_currentVeggieType] count:5];
    return [SKAction group:@[soundAction,[SKAction sequence:@[action0,action1]]]];
  }
  return nil;
}

+ (SKAction *)fingerClickAtSixTime:(VeggieType)_currentVeggieType soundPlay:(MyAVAudioPlayer *)_soundPlayer {
  if (_currentVeggieType == VeggieEggplant) {
    SKAction *soundAction = [SKAction sequence:@[[SKAction waitForDuration:1.30],[SKAction runBlock:^{
      [_soundPlayer upDateSoundPlayerUnderEmotionType:Emotion_Happy];
    }]]];
    SKAction *action0 =[SKAction eggplantBallDown];
    SKAction *action1 = [SKAction repeatAction:[SKAction happyAnimationWithInhabitantType:_currentVeggieType] count:5];
    return [SKAction group:@[soundAction,[SKAction sequence:@[action0,action1]]]];
  }
  return nil;
}

@end
