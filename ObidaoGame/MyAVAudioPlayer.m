//
//  MyAVAudioPlayer.m
//  ObidaoGame
//
//  Created by work on 12/20/13.
//  Copyright (c) 2013 Originate Inc. All rights reserved.
//

#import "MyAVAudioPlayer.h"

@implementation MyAVAudioPlayer

- (id)initPlayerWithEmotionType:(EmotionType)emotionType {
  if (self = [super init]) {
    _audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:[self loadSoundNameUnderEmotionType:emotionType]] error:nil];
    [_audioPlayer prepareToPlay];
    _audioPlayer.numberOfLoops = 0;
    [_audioPlayer prepareToPlay];
  }
  return self;
}

- (void)playSound {
  [_audioPlayer play];
}

- (void)stopSound {
  if (_audioPlayer.playing) {
    [_audioPlayer stop];
  }
}

- (void)upDateSoundPlayerUnderEmotionType:(EmotionType)emotionType {
  NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:[self loadSoundNameUnderEmotionType:emotionType] ofType:@"mp3"]];
  _audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
  [_audioPlayer prepareToPlay];
  [self playSound];
}

- (NSString *)loadSoundNameUnderEmotionType:(EmotionType)emotionType {
  switch (emotionType) {
    case Emotion_Fear:
      return  @"emotion_fear";
    case Emotion_Surprise:
      return  @"emotion_surprise";
    case Emotion_Disgust:
      return  @"emotion_disgust";
    case Emotion_Anger:
      return  @"emotion_anger";
    case Emotion_Sanness:
      return  @"emotion_sad";
    case Emotion_Happy:
      return  @"emotion_happy";
    default:return nil;
  }
  return nil;
}

@end
